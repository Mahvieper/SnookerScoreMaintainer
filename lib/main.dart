import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/logs_screen.dart';
import 'screens/splash_screen.dart';
void main() => runApp(new MaterialApp(home: MyApp(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal
  ),
  routes: <String, WidgetBuilder>{
    '/HomeScreen': (BuildContext context) => new HomeScreen(),
    //'/LogsScreen': (BuildContext context) => new LogsScreen()
  },));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
