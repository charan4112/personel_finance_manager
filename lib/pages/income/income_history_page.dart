import 'package:flutter/material.dart';
import '../../helpers/income_helper.dart';
import 'package:intl/intl.dart';

class IncomeHistoryPage extends StatefulWidget {
  const IncomeHistoryPage({super.key});

  @override
  State<IncomeHistoryPage> createState() => _IncomeHistoryPageState();
}

class _IncomeHistoryPageState extends State<IncomeHistoryPage> {
  List<Map<String, dynamic>> _incomeList = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadIncomeHistory();
  }

  Future<void> _loadIncomeHistory() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final incomes = await IncomeDatabaseHelper().getAllIncome();
      setState(() {
        _incomeList = incomes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Unable to fetch income data: $e";
        _isLoading = false;
      });
    }
  }

  String _formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('MMM dd, yyyy').format(date);
  }

  IconData _getIncomeIcon(String source) {
    final lowerSource = source.toLowerCase();
    if (lowerSource.contains('salary')) {
      return Icons.work;
    } else if (lowerSource.contains('bonus')) {
      return Icons.card_giftcard;
    } else if (lowerSource.contains('freelance')) {
      return Icons.laptop_mac;
    } else {
      return Icons.attach_money;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Income History"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadIncomeHistory,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                )
              : _incomeList.isEmpty
                  ? const Center(
                      child: Text(
                        'No income records found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: _loadIncomeHistory,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: _incomeList.length,
                        itemBuilder: (context, index) {
                          final income = _incomeList[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            elevation: 3,
                            child: ListTile(
                              leading: Icon(
                                _getIncomeIcon(income['source']),
                                color: Colors.green[700],
                              ),
                              title: Text(
                                income['source'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(_formatDate(income['date'])),
                              trailing: Text(
                                '\$${income['amount'].toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}
