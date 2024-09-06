import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zartek_test/utils/routes.dart';

import '../firebase_controller/fire_controller.dart';

class FirstScreen extends StatelessWidget {
  final FirebaseController firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/img.png",height: 160,width: 160,),
            SizedBox(height: Get.height * 0.1),
            GestureDetector(
              onTap: () {
                firebaseController.signInWithGoogle();
              },
              child: Container(
                width: Get.width * 0.8,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.blue,),
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding:  EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Ensure the SVG asset is correctly placed and referenced
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white,),
                        child: Center(
                          child: Image.asset(
                            "assets/images/img_1.png",
                            height: 20, // Adjust size as needed
                            width: 20,  // Adjust size as needed// Optional: color the SVG if needed
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.15), // Add spacing between icon and text
                      Text(
                        "Google",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02,),
            GestureDetector(
              onTap: () {
                firebaseController.signInWithGoogle();
              },
              child: Container(
                width: Get.width * 0.8,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.green,),
                padding: EdgeInsets.all(10),
                child: Padding(
                  padding:  EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Ensure the SVG asset is correctly placed and referenced
                      Image.asset(
                        "assets/images/img_2.png",
                        height: 24, // Adjust size as needed
                        width: 24,  // Adjust size as needed// Optional: color the SVG if needed
                      ),
                      SizedBox(width: Get.width * 0.15), // Add spacing between icon and text
                      Text(
                        "Phone",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02,),
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: IconButton(onPressed: () {
                Get.toNamed(Routes.home);
              }, icon: Icon(Icons.arrow_forward_ios_outlined,size: 25,)),
            )

          ],
        ),
      ),
    );
  }
}
