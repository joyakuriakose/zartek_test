import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase_controller/fire_controller.dart';

class Dashboard extends StatelessWidget {
  final FirebaseController firebaseController = Get.find<FirebaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Sign out when logout button is pressed
              firebaseController.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome to the Dashboard",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            Obx(() {
              // Display the user's email after sign-in
              String? userEmail = firebaseController.user;
              return Text(
                userEmail != null
                    ? "Logged in as: $userEmail"
                    : "No user logged in",
                style: TextStyle(fontSize: 18),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Sign out when button is pressed
                firebaseController.signOut();
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
