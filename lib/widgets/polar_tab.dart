import 'package:flutter/widgets.dart';
import 'package:polar_tab_bar/models/polar_tab_item.dart';
import 'package:polar_tab_bar/styles/polar_tab_colors.dart';

class PolarTab extends StatelessWidget {
  final int activeIndex;
  final List<PolarTabItem> tabs;
  final double contentSpacing;
  final double innerPadding;
  final double radius;
  final Color background;
  final Color activeBackground;
  final TextStyle titleStyle;
  final TextStyle activeTitleStyle;
  final bool isDense;
  final Curve curve;
  final Duration duration;
  final ValueChanged<PolarTabItem> onTabChanged;
  final bool showStep;

  const PolarTab({
    super.key,
    required this.activeIndex,
    required this.tabs,
    required this.contentSpacing,
    required this.innerPadding,
    required this.radius,
    required this.background,
    required this.activeBackground,
    required this.titleStyle,
    required this.activeTitleStyle,
    required this.isDense,
    required this.curve,
    required this.duration,
    required this.onTabChanged,
    this.showStep = false,
  }) : assert(tabs.length <= 4);

  factory PolarTab.step({
    required int activeIndex,
    required List<PolarTabItem> tabs,
    required double contentSpacing,
    required double innerPadding,
    required double radius,
    required Color background,
    required Color activeBackground,
    required TextStyle titleStyle,
    required TextStyle activeTitleStyle,
    required bool isDense,
    required Curve curve,
    required Duration duration,
    required ValueChanged<PolarTabItem> onTabChanged,
  }) =>
      PolarTab(
        activeIndex: activeIndex,
        tabs: tabs,
        contentSpacing: contentSpacing,
        innerPadding: innerPadding,
        radius: radius,
        background: background,
        activeBackground: activeBackground,
        titleStyle: titleStyle,
        activeTitleStyle: activeTitleStyle,
        isDense: isDense,
        curve: curve,
        duration: duration,
        onTabChanged: onTabChanged,
        showStep: true,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(contentSpacing),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedSlide(
            curve: curve,
            offset: Offset(1.0 * activeIndex, 0),
            duration: duration,
            child: FractionallySizedBox(
              widthFactor: 1 / tabs.length,
              child: Container(
                padding: EdgeInsets.all(isDense ? 16 : innerPadding),
                decoration: BoxDecoration(
                  color: activeBackground,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),
          ),
          Row(
            children: List.generate(
              tabs.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () => onTabChanged(tabs[index]),
                  child: Container(
                    color: PolarTabColors.transparent,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: showStep,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: duration,
                                curve: curve,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: activeIndex == index
                                      ? PolarTabColors.black
                                      : PolarTabColors.gray,
                                  borderRadius: BorderRadius.circular(radius),
                                ),
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: activeIndex == index
                                        ? PolarTabColors.white
                                        : PolarTabColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        AnimatedDefaultTextStyle(
                          duration: duration,
                          curve: curve,
                          style: index == activeIndex
                              ? activeTitleStyle
                              : titleStyle,
                          child: Text(
                            tabs[index].title,
                            //   style: index == activeIndex
                            //       ? activeTitleStyle
                            //       : titleStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
