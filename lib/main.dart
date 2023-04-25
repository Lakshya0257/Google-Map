import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:last_minute/helper/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}
