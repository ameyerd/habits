import 'package:flutter/material.dart';
import 'package:habits/home_page.dart';
import 'package:habits/settings_page.dart';
import 'package:habits/stats_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

// Bottom Navigation Bar
class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), StatsPage(), SettingsPage()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffeff5ff),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              title: Text('Statistics'), icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(
              title: Text('Settings'), icon: Icon(Icons.person))
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}
