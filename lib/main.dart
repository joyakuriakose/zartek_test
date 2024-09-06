import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zartek_test/utils/my_theme.dart';
import 'package:zartek_test/utils/routes.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await GetStorage.init();        // Initialize GetStorage if you're using it for persistent data

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.blue,
      ),
      initialRoute: Routes.splash,
      getPages: Routes.routes, // Define your routes
    ),
  );
}
