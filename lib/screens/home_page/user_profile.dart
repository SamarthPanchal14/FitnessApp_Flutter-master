

import 'package:flutter/material.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'User',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                LinearProgressIndicator(
                  value: 0.6,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
