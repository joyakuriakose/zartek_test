import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/login/dashboard.dart';
import '../screens/login/login_view.dart';
import '../utils/routes.dart';

class FirebaseController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  Rx<User?> _firebaseUser = Rx<User?>(null);

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      Get.offAll(() => Dashboard());
    } catch (error) {
      Get.snackbar("Error", "Google Sign-In failed: $error",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> createUser(String firstName, String lastName, String email, String password) async {

  }

  Future<void> login(String email, String password) async {

  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(Routes.login);
    } catch (error) {
      Get.snackbar("Error", "Error while signing out: $error",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
