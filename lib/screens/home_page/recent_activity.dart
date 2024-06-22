
import 'package:flutter/material.dart';

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text('Breakfast'),
            subtitle: Text('500 calories, 30g protein'),
            trailing: Text('2023-04-11'),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text('Running'),
            subtitle: Text('300 calories burned'),
            trailing: Text('2023-04-10'),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text('Progress Photo'),
            subtitle: Text('April 9, 2023'),
            trailing: Text('2023-04-24'),
          ),
        ],
      ),
    );
  }
}
