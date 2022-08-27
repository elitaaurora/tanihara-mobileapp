import 'package:flutter/material.dart';
import 'package:tanihara/homescreen.dart';
import 'package:tanihara/profile.dart';
import 'package:tanihara/timeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _layoutPage = [HomeScreen(), Timeline(), Profile()];
  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff0FA958),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
              activeIcon: Icon(Icons.home_filled, color: Color(0xff0FA958))),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: "Location",
              activeIcon:
                  Icon(Icons.location_on_outlined, color: Color(0xff0FA958))),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
              activeIcon: Icon(Icons.account_circle_outlined,
                  color: Color(0xff0FA958))),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}
