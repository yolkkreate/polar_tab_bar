import 'package:flutter/material.dart';
import 'package:polar_tab_bar/models/polar_tab_item.dart';
import 'package:polar_tab_bar/polar_tab_bar.dart';
import 'package:polar_tab_bar/widgets/polar_tab_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PolarTabItem> tabs = [
      PolarTabItem(
        index: 0,
        title: "All",
        page: const PolarTabPage(
          child: Center(child: Text("All")),
        ),
      ),
      PolarTabItem(
        index: 1,
        title: "Active",
        page: const PolarTabPage(
          child: Center(child: Text("Active")),
        ),
      ),
      PolarTabItem(
        index: 2,
        title: "Inactive",
        page: const PolarTabPage(
          child: Center(child: Text("Inactive")),
        ),
      ),
    ];

    return PolarTabBar(
      type: PolarTabType.step,
      tabs: tabs,
      isDense: true,
    );
  }
}
