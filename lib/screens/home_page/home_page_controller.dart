import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/home_page_model.dart';

// Assuming your model classes are imported

class HomeViewController extends GetxController {
  var homePageModel = HomePageModel().obs;  // Observable HomePageModel
  var isLoading = true.obs;  // Loading state
  var cart = <Dish, int>{}.obs; // Cart with dish and its quantity

  // Base URL
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
    // Logic to place order
    Get.defaultDialog(
      title: 'Order',
      middleText: 'Order successfully placed',
      onConfirm: () {
        cart.clear(); // Clear cart after placing the order
        Get.offAllNamed('/home'); // Redirect to home page
      },
      textConfirm: 'OK',
    );
  }
  @override
  void onInit() {
    fetchHomePageDetails();
    super.onInit();
  }

  // Method to fetch data
  void fetchHomePageDetails() async {
    try {
      isLoading(true);  // Set loading to true
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        homePageModel.value = HomePageModel.fromJson(json.decode(response.body));
      } else {
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);  // Set loading to false
    }
  }
}
// class HomeViewController extends GetxController with SingleGetTickerProviderMixin {
//   late TabController tabController;
//   final int tabCount = 4; // Update to match the number of tabs
//
//   RxList<Dish> allDishes = <Dish>[].obs; // Observable list of dishes
//
//   @override
//   void onInit() {
//     super.onInit();
//     tabController = TabController(length: tabCount, vsync: this);
//     fetchHomePageData(); // Fetch data when initializing the controller
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
//         // Extract all dishes from categories
//         List<Dish> dishes = [];
//         for (var category in homePageModel.categories ?? []) {
//           if (category.dishes != null) {
//             dishes.addAll(category.dishes!);
//           }
//         }
//
//         allDishes.value = dishes; // Update observable list
//       } else {
//         Get.snackbar('Error', 'Failed to load data');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'An error occurred: $e');
//     }
//   }
// }
