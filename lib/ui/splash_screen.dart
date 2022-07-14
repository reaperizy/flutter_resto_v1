import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/const.dart';
import 'package:restaurant_app/ui/list_page.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationRoute);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationRoute() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => ListPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorBrown,
        body: Center(
            child: Center(child: Image.asset('assets/images/Resto.png'))));
  }
}
