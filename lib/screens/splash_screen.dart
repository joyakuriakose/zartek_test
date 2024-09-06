import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../utils/my_theme.dart';
import '../utils/routes.dart';
import 'first_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => FirstScreen()); // Navigate to FirstScreen after 3 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/images/bubbles.json",
              height: Get.height * 0.2,
              width: Get.width * 0.5,
            ),
            SizedBox(height: Get.height * 0.015),
            Text(
              "welcome".toUpperCase(),
              style: TextStyle(
                fontSize: Get.height * 0.037,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


