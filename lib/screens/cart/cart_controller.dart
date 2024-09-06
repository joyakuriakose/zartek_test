
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/home_page_model.dart';
import '../home_page/home_page_controller.dart';
//
class Dish {
  final String? name;
  final double? price;
  final String? description;

  Dish({this.name, this.price, this.description});
}
class CartController extends GetxController {
  var cart = <Dish, int>{}.obs;

  double get totalPrice {
    double total = 0;
    cart.forEach((dish, quantity) {
      total += (dish.price ?? 0) * quantity;
    });
    return total;
  }
}

