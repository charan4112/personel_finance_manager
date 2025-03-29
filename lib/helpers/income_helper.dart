import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class IncomeDatabaseHelper {
  static final IncomeDatabaseHelper _instance = IncomeDatabaseHelper._internal();
  factory IncomeDatabaseHelper() => _instance;
  IncomeDatabaseHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'income.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE income(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount REAL,
            source TEXT,
            date TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertIncome(Map<String, dynamic> incomeData) async {
    final db = await database;
    return await db.insert('income', incomeData);
  }

  Future<List<Map<String, dynamic>>> getAllIncome() async {
    final db = await database;
    return await db.query('income', orderBy: 'date DESC');
  }
}