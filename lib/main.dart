import 'package:ecommerce_task1/presentation/app_screens/home_screen.dart';
import 'package:ecommerce_task1/presentation/app_theme/app_theme_data.dart';
import 'package:flutter/material.dart';

import 'di.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName,
      routes: {

        HomeScreen.routeName: (_) => HomeScreen(),
      },
      theme: AppThemeData.lightTheme,
    );
  }
}
