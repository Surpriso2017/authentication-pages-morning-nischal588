import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:insta/bottom_curved_navigation_bar.dart';
import 'package:insta/profile_screen.dart';

class BottomAnimatedNavBar extends StatefulWidget {
  const BottomAnimatedNavBar({Key? key}) : super(key: key);

  @override
  State<BottomAnimatedNavBar> createState() => _BottomAnimatedNavBarState();
}

class _BottomAnimatedNavBarState extends State<BottomAnimatedNavBar> {
  int currentIndex = 0;
  final pageControl = PageController();
  List<IconData> animatedNavBarItems = [Icons.home, Icons.person];

  onPressedAnimatedNavBarItem(int index) {
    currentIndex = index;
    pageControl.jumpToPage(index);
    setState(() {});
  }

  buildAnimatedNavBar() {
    return AnimatedBottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        icons: animatedNavBarItems,
        activeIndex: currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        activeColor: Colors.white,
        inactiveColor: Colors.black,
        iconSize: 20,
        onTap: (onPressed) {
          onPressedAnimatedNavBarItem(onPressed);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomCurvedNavigationBar()));
        },
        child: Icon(Icons.navigation),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: PageView(
          controller: pageControl,
          children: [Container(), ProfileScreen()],
        ),
      ),
      bottomNavigationBar: buildAnimatedNavBar(),
    );
  }
}
