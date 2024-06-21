import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/screens/login/loginpage.dart';
import 'package:fitnessapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/home_page/action_button.dart';
import 'package:fitnessapp/screens/home_page/activity_tile.dart';
import 'package:fitnessapp/screens/profile/profile.dart';
import 'package:fitnessapp/screens/meal/meal_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../workout/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late SharedPreferences _preferences;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomePage()),
        // );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WorkoutPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              userId: FirebaseAuth.instance.currentUser!.uid.toString(),
            ),
          ),
        );
        break;
      // case 3:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ProfilePage(userId: 'omzr7txwacZ46j2IHgcM3VD1Aix2',)),
      //   );
      //   break;
    }
  }

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
        leading: Container(),
        leadingWidth: 0,
        title: const Text('Fitness App'),
        actions: [
          IconButton(
            onPressed: () => _showLogoutDialog(),
            icon: Icon(Icons.logout),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.timeline),
          //   label: 'Progress',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

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
                      value: 0.7,
                      strokeWidth: 15,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.green),
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
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.red),
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
