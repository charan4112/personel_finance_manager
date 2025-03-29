import 'package:flutter/material.dart';

// Page imports
import 'pages/welcome_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/signup_page.dart';
import 'pages/dashboard.dart'; // ✅ Added Dashboard

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finance Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Quicksand',
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/dashboard': (context) => const Dashboard(), // ✅ Dashboard wired
        // Placeholders for upcoming routes
        '/add-expense': (context) => const Placeholder(),
        '/add-income': (context) => const Placeholder(),
        '/goal': (context) => const Placeholder(),
        '/reports': (context) => const Placeholder(),
      },
    );
  }
}