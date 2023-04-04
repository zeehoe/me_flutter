import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Image.asset(
      "assets/welcome.gif",
      height: 225.0,
      width: 225.0,
    )));
  }
}
