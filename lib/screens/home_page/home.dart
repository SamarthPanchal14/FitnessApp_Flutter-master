import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/screens/home_page/daily_progress.dart';
import 'package:fitnessapp/screens/home_page/quick_actions.dart';
import 'package:fitnessapp/screens/home_page/recent_activity.dart';
import 'package:fitnessapp/screens/home_page/user_profile.dart';
import 'package:fitnessapp/screens/login/loginpage.dart';
import 'package:fitnessapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/profile/profile.dart';
import 'package:fitnessapp/screens/meal/meal_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../workout/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late SharedPreferences _preferences;

  Future<void> _showLogoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Do you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                _preferences = await SharedPreferences.getInstance();
                _preferences.setBool(prefIsLogin, false);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                      (Route<dynamic> route) => false,
                );
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness App'),
        actions: [
          IconButton(
            onPressed: () => _showLogoutDialog(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            UserProfileSection(),
            QuickActionsSection(),
            DailyProgressSection(),
            RecentActivitySection(),
          ],
        ),
      ),
    );
  }

}
