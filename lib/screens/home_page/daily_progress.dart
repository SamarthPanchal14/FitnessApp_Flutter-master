

import 'package:flutter/material.dart';

class DailyProgressSection extends StatelessWidget {
  const DailyProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              'Daily Progress',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Calories Burned'),
                    const SizedBox(height: 8.0),
                    CircularProgressIndicator(
                      value: 0.9,
                      strokeWidth: 15,
                      color: Colors.green,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Protein Intake'),
                    const SizedBox(height: 8.0),
                    CircularProgressIndicator(
                      value: 0.4,
                      strokeWidth: 15,
                      color: Colors.red,

                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18.0),
          ],
        ),
      ),
    );
  }
}
