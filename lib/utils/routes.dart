import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/cart/cart_bindings.dart';
import '../screens/cart/cart_view.dart';
import '../screens/home_page/home_page_binding.dart';
import '../screens/home_page/home_page_view.dart';
import '../screens/login/login_bindings.dart';
import '../screens/login/login_view.dart';
import '../screens/splash_screen.dart';


class Routes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const cart = '/cartPage';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      binding: LoginViewBindings(),
      name: login,
      page: () => LoginView(),
    ),
    GetPage(
      binding: HomeViewBindings(),
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      binding: CartBindings(),
      name: cart,
      page: () => CartPage(),
    ),
  ];
}

