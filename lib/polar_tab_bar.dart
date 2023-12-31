library polar_tab_bar;

import 'package:flutter/widgets.dart';

import 'models/polar_tab_item.dart';
import 'styles/polar_tab_colors.dart';
import 'widgets/polar_tab.dart';
import 'widgets/polar_page.dart';

enum PolarTabType { pill, step }

class PolarTabBar extends StatefulWidget {
  final PageController? pageController;
  final List<PolarTabItem> tabs;
  final double? height;
  final double contentSpacing;
  final double innerPadding;
  final double radius;
  final Color? background;
  final Color? activeBackground;
  final TextStyle? titleStyle;
  final TextStyle? activeTitleStyle;
  final bool isDense;
  final Curve curve;
  final Duration? duration;
  final PolarTabType type;
  final bool swipeable;

  const PolarTabBar({
    super.key,
    this.pageController,
    required this.tabs,
    this.height,
    this.contentSpacing = 8,
    this.innerPadding = 20,
    this.radius = 360,
    this.background,
    this.activeBackground,
    this.titleStyle,
    this.activeTitleStyle,
    this.isDense = false,
    this.curve = Curves.easeInOut,
    this.duration,
    this.type = PolarTabType.pill,
    this.swipeable = true,
  });

  @override
  State<PolarTabBar> createState() => _PolarTabBarState();
}

class _PolarTabBarState extends State<PolarTabBar> {
  int _activeIndex = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: _activeIndex);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.type == PolarTabType.pill
            ? PolarTab(
                activeIndex: _activeIndex,
                tabs: widget.tabs,
                contentSpacing: widget.contentSpacing,
                innerPadding: widget.innerPadding,
                radius: widget.radius,
                background: widget.background ?? PolarTabColors.background,
                activeBackground:
                    widget.activeBackground ?? PolarTabColors.activeBackground,
                titleStyle: widget.titleStyle ??
                    TextStyle(
                      color: PolarTabColors.gray,
                      fontSize: widget.isDense ? 12 : 14,
                      fontWeight: FontWeight.normal,
                    ),
                activeTitleStyle: widget.activeTitleStyle ??
                    TextStyle(
                      color: PolarTabColors.black,
                      fontSize: widget.isDense ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                isDense: widget.isDense,
                curve: widget.curve,
                duration: widget.duration ?? const Duration(milliseconds: 300),
                onTabChanged: (tabItem) {
                  setState(() {
                    _activeIndex = tabItem.index;
                    if (widget.swipeable) {
                      _pageController.jumpToPage(tabItem.index);
                    } else {
                      _pageController.animateToPage(
                        tabItem.index,
                        duration: widget.duration ??
                            const Duration(milliseconds: 300),
                        curve: widget.curve,
                      );
                    }
                  });
                },
              )
            : PolarTab.step(
                activeIndex: _activeIndex,
                tabs: widget.tabs,
                contentSpacing: widget.contentSpacing,
                innerPadding: widget.innerPadding,
                radius: widget.radius,
                background: widget.background ?? PolarTabColors.background,
                activeBackground:
                    widget.activeBackground ?? PolarTabColors.activeBackground,
                titleStyle: widget.titleStyle ??
                    TextStyle(
                      color: PolarTabColors.gray,
                      fontSize: widget.isDense ? 12 : 14,
                      fontWeight: FontWeight.normal,
                    ),
                activeTitleStyle: widget.activeTitleStyle ??
                    TextStyle(
                      color: PolarTabColors.black,
                      fontSize: widget.isDense ? 12 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                isDense: widget.isDense,
                curve: widget.curve,
                duration: widget.duration ?? const Duration(milliseconds: 300),
                onTabChanged: (tabItem) {
                  setState(() {
                    _activeIndex = tabItem.index;
                    if (widget.swipeable) {
                      _pageController.jumpToPage(tabItem.index);
                    } else {
                      _pageController.animateToPage(
                        tabItem.index,
                        duration: widget.duration ??
                            const Duration(milliseconds: 300),
                        curve: widget.curve,
                      );
                    }
                  });
                },
              ),
        const SizedBox(height: 32),
        PolarPage(
          pageController: _pageController,
          swipeable: widget.swipeable,
          tabs: widget.tabs,
          height: widget.height,
          onPageSwiped: widget.swipeable
              ? (index) {
                  setState(() {
                    _activeIndex = index;
                  });
                }
              : null,
        ),
      ],
    );
  }
}
