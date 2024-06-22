

import 'package:fitnessapp/screens/home_page/activity_tile.dart';
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
          ActivityTile(
            title: 'Breakfast',
            subtitle: '500 calories, 30g protein',
            date: '2023-04-11',
          ),
          ActivityTile(
            title: 'Running',
            subtitle: '300 calories burned',
            date: '2023-04-10',
          ),
          ActivityTile(
            title: 'Progress Photo',
            subtitle: 'April 9, 2023',
            date: '2023-04-09',
          ),
        ],
      ),
    );
  }
}
