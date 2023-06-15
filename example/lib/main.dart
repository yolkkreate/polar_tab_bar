import 'package:example/pages/category_page.dart';
import 'package:example/pages/home_page.dart';
import 'package:example/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:polar_tab_bar/models/polar_tab_item.dart';
import 'package:polar_tab_bar/polar_tab_bar.dart';
import 'package:polar_tab_bar/widgets/polar_tab_page.dart';

void main() {
  runApp(const PolarTabBarApp());
}

class PolarTabBarApp extends StatelessWidget {
  const PolarTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PolarTabItem> tabs = [
      PolarTabItem(
        index: 0,
        title: "Home",
        page: const PolarTabPage(
          child: HomePage(),
        ),
      ),
      PolarTabItem(
        index: 1,
        title: "Category",
        page: const PolarTabPage(child: CategoryPage()),
      ),
      PolarTabItem(
        index: 2,
        title: "Profile",
        page: const PolarTabPage(child: ProfilePage()),
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            "Polar Tabbar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PolarTabBar(
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
