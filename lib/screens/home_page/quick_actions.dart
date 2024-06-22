
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
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.restaurant),
                iconSize: 36.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MealPage()),
                  );
                },
              ),
              const SizedBox(height: 8.0),
              Text('Track Meal'),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.fitness_center),
                iconSize: 36.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  WorkoutPage()),
                  );
                },
              ),
              const SizedBox(height: 8.0),
              Text('Start Workout'),
            ],
          ),
        ],
      ),
    );
  }
}
