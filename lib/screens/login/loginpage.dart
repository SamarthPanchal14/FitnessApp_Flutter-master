import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/screens/home_page/home.dart';
import 'package:fitnessapp/screens/signup/signuppage.dart';
import 'package:fitnessapp/utils/constants.dart';
import 'package:fitnessapp/utils/uihelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences _preferences;

  login(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) async {
          _preferences = await SharedPreferences.getInstance();
          _preferences.setBool(prefIsLogin, true);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: TextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          // UiHelper.CustomTextField(passwordController, "Password",
          //     Icons.password, true, TextInputType.text, true),

          const SizedBox(height: 30),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Colors.black,
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          // UiHelper.CustomButton(() {
          //   login(emailController.text.toString(),
          //       passwordController.text.toString());
          // }, "Login"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already Have an Account?",
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
