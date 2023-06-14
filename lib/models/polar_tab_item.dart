import 'package:flutter/widgets.dart';

class PolarTabItem {
  final int index;
  final String? route;
  final String title;
  final Widget page;

  PolarTabItem({
    required this.index,
    this.route,
    required this.title,
    required this.page,
  });
}
