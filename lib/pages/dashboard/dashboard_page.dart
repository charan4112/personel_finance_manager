import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Track and manage your finances easily.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Placeholder Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard(title: 'Total Income', value: '\$0.00'),
                _buildInfoCard(title: 'Total Expenses', value: '\$0.00'),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(title: 'Investments', value: '\$0.00'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String value}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}