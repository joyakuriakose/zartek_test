import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../firebase_controller/fire_controller.dart';
import '../../models/home_page_model.dart';


class HomeViewController extends GetxController {
  //final FirebaseController firebaseController = Get.find<FirebaseController>();
  var homePageModel = HomePageModel().obs;
  var isLoading = true.obs;
  var cart = <Dish, int>{}.obs;

  final String baseUrl = 'https://run.mocky.io/v3/18e8dae4-f39d-46bc-9cf6-9f8b97c32f9c';
  void addToCart(Dish dish) {
    if (cart.containsKey(dish)) {
      cart[dish] = (cart[dish] ?? 0) + 1;
    } else {
      cart[dish] = 1;
    }
  }

  void removeFromCart(Dish dish) {
    if (cart.containsKey(dish)) {
      if ((cart[dish] ?? 0) > 1) {
        cart[dish] = (cart[dish] ?? 0) - 1;
      } else {
        cart.remove(dish);
      }
    }
  }

  void placeOrder() {
    Get.defaultDialog(
      title: 'Order',
      middleText: 'Order successfully placed',
      onConfirm: () {
        cart.clear();
        Get.offAllNamed('/home');
      },
      textConfirm: 'OK',
    );
  }
  @override
  void onInit() {
    fetchHomePageDetails();
    super.onInit();
  }

  void fetchHomePageDetails() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        homePageModel.value = HomePageModel.fromJson(json.decode(response.body));
      } else {
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
// class HomeViewController extends GetxController with SingleGetTickerProviderMixin {
//   late TabController tabController;
//   final int tabCount = 4;
//
//   RxList<Dish> allDishes = <Dish>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     tabController = TabController(length: tabCount, vsync: this);
//     fetchHomePageData();
//   }
//
//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }
//
//   Future<void> fetchHomePageData() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://run.mocky.io/v3/18e8dae4-f39d-46bc-9cf6-9f8b97c32f9c'
//       ));
//
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         HomePageModel homePageModel = HomePageModel.fromJson(data);
//
//
//         List<Dish> dishes = [];
//         for (var category in homePageModel.categories ?? []) {
//           if (category.dishes != null) {
//             dishes.addAll(category.dishes!);
//           }
//         }
//
//         allDishes.value = dishes;
//       } else {
//         Get.snackbar('Error', 'Failed to load data');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//     }
//   }
// }
