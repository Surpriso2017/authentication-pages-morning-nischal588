import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:insta/profile_screen.dart';

import 'bottom_animated_navigation.dart';

class BottomCurvedNavigationBar extends StatefulWidget {
  const BottomCurvedNavigationBar({Key? key}) : super(key: key);

  @override
  State<BottomCurvedNavigationBar> createState() =>
      _BottomCurvedNavigationBarState();
}

class _BottomCurvedNavigationBarState extends State<BottomCurvedNavigationBar> {
  int currentIndex = 0;
  final pageControl = PageController();
  List<Widget> curvedNavBarItems = [Icon(Icons.home), Icon(Icons.person)];

  buildCurevedBottomNavBar() {
    return CurvedNavigationBar(
      backgroundColor: Colors.greenAccent,
      color: Colors.blueGrey,
      buttonBackgroundColor: Colors.white,
      animationCurve: Curves.easeInCirc,
      animationDuration: Duration(milliseconds: 800),
      items: curvedNavBarItems,
      onTap: (onPressed) {
        onPressedAnimatedNavBarItem(onPressed);
      },
    );
  }

  onPressedAnimatedNavBarItem(int index) {
    currentIndex = index;
    pageControl.jumpToPage(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageControl,
          children: [Container(color: Colors.blue), ProfileScreen()],
        ),
        bottomNavigationBar: buildCurevedBottomNavBar());
  }
}
