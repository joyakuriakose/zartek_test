import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../components/app_buttons.dart';
import 'cart_controller.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text(
          'Order Summary',
          style: TextStyle(
            color: Colors.grey, // Title color
          ),
        ),
        backgroundColor: Colors.white, // AppBar background color
        iconTheme: IconThemeData(
          color: Colors.grey, // Back arrow color
        ),
        elevation: 1, // Removes shadow under the AppBar
      ),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                      "${controller.cart.length} Items",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            Obx(() {
              if (controller.cart.isEmpty) {
                return Center(child: Text('Your cart is empty.'));
              }
              return Column(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cart.keys.length,
                      itemBuilder: (context, index) {
                        var dish = controller.cart.keys.elementAt(index);
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: Colors.green,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 5,
                                    )),
                                SizedBox(width: 10),
                                Text(
                                  dish.name ?? 'Dish Name',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'INR ${dish.price}', // Use INR
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Text(
                                  'Qty: ${controller.cart[dish]}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: INR ${controller.totalPrice.toStringAsFixed(2)}'),
                        ElevatedButton(
                          onPressed: () {
                          //  controller.placeOrder();
                          },
                          child: Text('Place Order'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
        Positioned(
          bottom: 5,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  Text('INR ${controller.totalPrice.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18, color: Colors.green),),
                ],
              ),
              Divider(thickness: 2),
              Center(
                child: MAButton(
                  text: 'Service Request',
                  buttonPress: () async {

                  },
                  isEnabled: true,
                  padding: const EdgeInsets.all(30),
                  height: Get.height * 0.06,
                  width: Get.width * 0.5,
                  clipBehavior: 0,
                  radius: 30,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}




// class CartPage extends GetView<CartController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Order Summary',
//           style: TextStyle(
//             color: Colors.grey, // Title color
//           ),
//         ),
//         backgroundColor: Colors.white, // AppBar background color
//         iconTheme: IconThemeData(
//           color: Colors.grey, // Back arrow color
//         ),
//         elevation: 1, // Removes shadow under the AppBar
//       ),
//       body: Stack(children: [
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 15.0, left: 15, right: 15, bottom: 15),
//               child: Container(
//                 height: 40,
//                 width: 700,
//                 decoration: BoxDecoration(
//                     color: Colors.green[900],
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Center(
//                     child: Text(
//                   "2 Dishes - 2 items",
//                   style: TextStyle(color: Colors.white),
//                 )),
//               ),
//             ),
//             Obx(() {
//               if (controller.cart.isEmpty) {
//                 return Center(child: Text('Your cart is empty.'));
//               }
//               return Column(
//                 children: [
//                   Container(
//                     height: 30,
//                     width: 800,
//                     decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: controller.cart.keys.length,
//                       itemBuilder: (context, index) {
//                         return Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                         height: Get.height * 0.05,
//                                         width: Get.width * 0.1,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.rectangle,
//                                           border: Border.all(
//                                             color: Colors.green,
//                                             width: 1.0,
//                                           ),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.green,
//                                             radius: 5,
//                                           ),
//                                         )),
//                                     SizedBox(
//                                       width: Get.width * 0.01,
//                                     ),
//                                     Text(
//                                      "name",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500),
//                                     )
//                                   ],
//                                 ),
//                                 Container(
//                                   height: 30,
//                                   width: 60,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.green[900]),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       TextButton(
//                                         onPressed: () {},
//                                         child: Text(
//                                           '-',
//                                           style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         style: TextButton.styleFrom(
//                                           backgroundColor: Colors.green,
//                                         ),
//                                       ),
//                                       SizedBox(width: 20),
//                                       Obx(() {
//
//                                         return Text(
//                                           '',
//                                           style: TextStyle(
//                                             fontSize: 24,
//                                             color: Colors.white,
//                                           ),
//                                         );
//                                       }),
//                                       SizedBox(width: 20),
//                                       TextButton(
//                                         onPressed: () {},
//                                         child: Text(
//                                           '+',
//                                           style: TextStyle(
//                                             fontSize: 24,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         style: TextButton.styleFrom(
//                                           backgroundColor: Colors.green,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Text(
//                               'INR', // Use INR
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Total: INR '),
//                         ElevatedButton(
//                           onPressed: () {
//
//                           },
//                           child: Text('Place Order'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }),
//           ],
//         ),
//         Positioned(
//           bottom: 5,
//           left: 20,
//           right: 20,
//           child: Column(
//             children: [
//               Divider(thickness: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Total Amount', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
//                   Text('45876458', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,
//                   color: Colors.green),),
//                 ],
//               ),
//               Divider(thickness: 2),
//
//               Center(
//                 child: MAButton(
//                   text: 'Place Order',
//                   buttonPress: () async {},
//                   isEnabled: true,
//                   padding: const EdgeInsets.all(30),
//                   height: Get.height * 0.06,
//                   width: Get.width * 0.8,
//                   clipBehavior: 0,
//                   radius: 30,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
