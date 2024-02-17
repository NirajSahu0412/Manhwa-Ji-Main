import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manhwa_ji/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;
  void navBarTap(int index){
    setState(() {
      selectedNavIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manhwa Ji",
        ),
      ),
      body: Center(
        child: Text("Hello"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedNavIndex,
        onTap: navBarTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.compass_fill,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.heart_fill,
            ),
            label: "Favourate",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.clock_fill,
            ),
            label: "Recent",
          ),
        ],
      ),
    );
  }
}
