import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cross/DrawerPages/HelpPage.dart';
import 'package:cross/DrawerPages/events.dart';
import 'package:cross/screens/Academic.dart';
import 'package:cross/screens/AllScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class rootView extends StatefulWidget {
  const rootView({Key? key}) : super(key: key);

  @override
  _rootViewState createState() => _rootViewState();
}
int _currentIndex = 0;
final List list = [
  AllScreen(),
  Academic(),
  Events(),
  HelpPage(),

];
class _rootViewState extends State<rootView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: list[_currentIndex],
        bottomNavigationBar: BottomNavyBar(

            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.apps_rounded),
                title: Text('Apps'),
                activeColor: Colors.red,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.person_rounded),
                title: Text('Profile'),
                activeColor: Colors.purpleAccent,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.event),
                title: Text("Events"),
                activeColor: Colors.pink,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(icon: Icon(Icons.help),
                title: Text("Help"),
                activeColor: Colors.deepPurple,
                textAlign: TextAlign.center,
              ),
              // BottomNavyBarItem(icon: Icon(Icons.search),
              //   title: Text("Help"),
              //   activeColor: Colors.deepPurple,
              //   textAlign: TextAlign.center,
              // )
            ]
        )
    );
  }
}