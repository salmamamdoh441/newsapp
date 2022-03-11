import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/screens/homeScreen.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, HomeScreen.id);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff551d88),
        body:Center(
          child: Image.asset('assets/logo.png'),
        ));
  }
}
