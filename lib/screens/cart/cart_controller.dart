
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/home_page_model.dart';
import '../home_page/home_page_controller.dart';

class Dish {
  final String? name;
  final double? price; // Ensure this is a double
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
  // void placeOrder() {
  //   // Show the confirmation dialog
  //   Get.defaultDialog(
  //     title: 'Order Confirmation',
  //     content: Text('Order successfully placed'),
  //     confirm: ElevatedButton(
  //       onPressed: () {
  //         // Clear the cart
  //         cart.clear();
  //
  //         // Navigate to the homepage
  //         Get.find<HomeViewController>().updateHomeView();
  //
  //         // Close the dialog
  //         Get.back();
  //       },
  //       child: Text('OK'),
  //     ),
  //   );
  // }
