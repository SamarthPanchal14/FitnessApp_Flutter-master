

import 'package:fitnessapp/screens/home_page/action_button.dart';
import 'package:fitnessapp/screens/meal/meal_page.dart';
import 'package:fitnessapp/screens/workout/workout_page.dart';
import 'package:flutter/material.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionButton(
            icon: Icons.restaurant,
            label: 'Track Meal',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MealPage()),
              );
            },
          ),
          ActionButton(
            icon: Icons.fitness_center,
            label: 'Start Workout',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutPage()),
              );
            },
          ),
          // ActionButton(
          //   icon: Icons.camera_alt,
          //   label: 'Upload Progress',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const ProgressTrackingPage()),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
