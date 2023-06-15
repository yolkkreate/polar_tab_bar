import 'package:polar_tab_bar/widgets/polar_tab_page.dart';

class PolarTabItem {
  final int index;
  final String? route;
  final String title;
  final PolarTabPage page;

  PolarTabItem({
    required this.index,
    this.route,
    required this.title,
    required this.page,
  });
}
