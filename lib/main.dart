import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Constants.purpleDark,
        canvasColor: Constants.purpleLight,
      ),
      // home: const WidgetTree(),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          "images/icon/icon.png",
        ),
        nextScreen: const WidgetTree(),
        backgroundColor: Colors.teal,
        splashTransition: SplashTransition.fadeTransition,
        duration: 1500,
      ),
    );
  }
}
