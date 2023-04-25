import 'package:get/get.dart';

import 'package:last_minute/app/modules/homepage/binding/homepage_binding.dart';
import 'package:last_minute/app/modules/homepage/view/homepage.dart';
import 'package:last_minute/app/modules/login/binding/logIn_binding.dart';
import 'package:last_minute/app/modules/login/view/login.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: LogIn.route,
      page: () => const LogIn(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: Homepage.route,
      page: () => Homepage(),
      binding: HomepageBinding(),
    ),
  ];
}
