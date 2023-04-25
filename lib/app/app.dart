import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';
import '../utils/theme.dart';
import 'modules/homepage/view/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      getPages: AppRoutes.pages,
      initialRoute: Homepage.route,
      // initialRoute: SPController().getIsLoggedin()? Homepage.route :LogIn.route,
    );
  }
}
