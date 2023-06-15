import 'package:flutter/widgets.dart';
import 'package:polar_tab_bar/models/polar_tab_item.dart';

class PolarPage extends StatelessWidget {
  final PageController pageController;
  final List<PolarTabItem> tabs;
  final double? height;
  final bool swipeable;
  final ValueChanged<int>? onPageSwiped;

  const PolarPage({
    super.key,
    required this.pageController,
    required this.tabs,
    this.height,
    required this.swipeable,
    this.onPageSwiped,
  });

  @override
  Widget build(BuildContext context) {
    return height != null
        ? SizedBox(
            height: height,
            child: PageView.builder(
              controller: pageController,
              physics: swipeable
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              itemCount: tabs.length,
              itemBuilder: (ctx, index) => tabs[index].page,
              onPageChanged: onPageSwiped,
            ),
          )
        : Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: swipeable
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              itemCount: tabs.length,
              itemBuilder: (ctx, index) => tabs[index].page,
              onPageChanged: onPageSwiped,
            ),
          );
  }
}
