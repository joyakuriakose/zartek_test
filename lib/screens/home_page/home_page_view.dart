import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/rounded_loader.dart';
import '../../utils/my_utils.dart';
import '../../utils/routes.dart';
import 'home_page_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeViewController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Assuming MyUtils is correctly implemented
        MyUtils.hideKeyboard();
      },
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/img_3.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Joya kuriakose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ID: 777',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: Get.width * 0.05),
                    GestureDetector(
                      onTap: (){
                        Get.offAllNamed(Routes.first); // Make sure 'Routes.login' is the correct route name for your login page
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
              color: Colors.black),
          actions: [
            Obx(() {
              final cartCount = controller.cart.length; // Update based on your cart model
              return IconButton(
                icon: Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    if (cartCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Center(
                            child: Text(
                              '$cartCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Get.toNamed(Routes.cart);
                },
              );
            }),
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: RoundedLoader());
          }
          if (controller.homePageModel.value?.categories == null ||
              controller.homePageModel.value!.categories!.isEmpty) {
            return Center(child: Text('No categories available'));
          }

          return DefaultTabController(
            length: controller.homePageModel.value!.categories!.length,
            child: Column(
              children: [
              Container(
              color: Colors.white,
              child: TabBar(
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: controller.homePageModel.value!.categories!
                    .map((category) {
                  return Tab(text: category.name ?? 'Category');
                }).toList(),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: controller.homePageModel.value!.categories!
                    .map((category) {
                  return ListView.builder(
                    itemCount: category.dishes?.length ?? 0,
                    itemBuilder: (context, index) {
                      final dish = category.dishes![index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 15),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 5,
                                        ),
                                      )),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Text(
                                    dish.name ?? 'Dish Name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'INR ${dish.price}', // Use INR
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          ' ${dish.calories} calories ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Container(
                                          width: Get.width * 0.1,
                                          height: Get.height * 0.1,
                                          margin: EdgeInsets.only(right: 8.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/images/img.png',
                                            image: dish.imageUrl ?? '',
                                            fit: BoxFit.cover,
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/img.png',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: Get.width * 0.7,
                                child: Text(
                                  dish.description ?? 'No description',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              if (dish.addons != null && dish.addons!.isNotEmpty)
                                Text(
                                  'Customizations Available',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.red,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          controller.removeFromCart(dish);
                                        },
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Obx(() {
                                        final count = controller.cart[dish] ?? 0;
                                        return Text(
                                          '$count',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        );
                                      }),
                                      SizedBox(width: 20),
                                      TextButton(
                                        onPressed: () {
                                          controller.addToCart(dish);
                                        },
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Divider(
                                thickness: 2,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

            )]
            ),
          );
        }),
      ),
    );
  }
}

