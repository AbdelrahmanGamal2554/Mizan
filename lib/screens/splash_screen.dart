import 'package:flutter/material.dart';
import 'package:mizan/screens/signup.dart';
import 'package:mizan/screens/home_screen.dart';
import 'package:mizan/databases/shared_pref.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return (SharedPref.containKey('username') &&
                        SharedPref.containKey('email')) &&
                    SharedPref.containKey('income') &&
                    SharedPref.containKey('balance') &&
                    SharedPref.containKey('country')
                ? HomeScreen()
                : Signup();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeIn(
          duration: const Duration(seconds: 3),
          curve: Curves.easeIn,
          child: Stack(
            children: [
              Image.asset("assets/images/mizan.png"),
              Positioned(
                left: 0,
                right: 0,
                bottom: 80,
                child: Text(
                  "ميزان",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: "Gulzar",
                    color: Colors.white60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
