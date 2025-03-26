import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Test',
      theme: ThemeData(
        fontFamily: 'Quicksand', // Apply your custom font
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quicksand Font Test'),
      ),
      body: const Center(
        child: Text(
          'Hello, Stylish World!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
