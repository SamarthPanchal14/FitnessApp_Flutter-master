import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/screens/bottom_nav/bottom_nav.dart';
import 'package:fitnessapp/screens/home_page/home.dart';
import 'package:fitnessapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/on_boarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences _preferences;
  bool isLogin = false;

  _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    isLogin = _preferences.getBool(prefIsLogin) ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin ? const BottomNavScreen() : const OnboardingScreen(),
    );
  }
}
