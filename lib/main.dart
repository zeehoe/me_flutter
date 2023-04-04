import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/splash.dart';
import './pages/home.dart';
import './pages/quote.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/home': (context) => Home(),
      '/quote': (context) => Quote(),
    },
  ));
}
