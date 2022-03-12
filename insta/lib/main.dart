import 'package:flutter/material.dart';
import 'package:insta/bottom_animated_navigation.dart';
import 'package:insta/login_screen.dart';

import 'bottom_curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 14),
              bodyText1: TextStyle(fontSize: 14),
              headline1: TextStyle(fontSize: 14),
              headline3: TextStyle(fontSize: 14)),
          primarySwatch: Colors.blue,
        ),
        home: (LoginScreen()));
  }
}
