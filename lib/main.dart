import 'package:flutter/material.dart';
import 'package:thenews/screens/SplashScreen.dart';
import 'package:thenews/utitites/app_theme.dart';
import 'utitites/app_theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.apptheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


