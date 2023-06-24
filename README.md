# Polar Tab Bar

A decent & customizable rounded tabbar with built-in PageView that can save UI state.

There are two types of Polar Tab Bar, the `Pill` annd the `Step`

| Pill (`PolarTabType.Pill`)                                                                 | Step (`PolarTabType.Step`)                                                         |
| ------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- |
| ![Pill type Gif](https://github.com/yolkkreate/polar_tab_bar/blob/main/assets/default.gif) | ![Step Gif](https://github.com/yolkkreate/polar_tab_bar/blob/main/assets/step.gif) |

## Get Started

Add the `polar_tab_bar` in your `pubspec.yaml`

```yaml
dependencies:
  ...
  polar_tab_bar: ^0.0.1
```

## Basic Usage

First create the tab items

```dart
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
```

Note: Wrap your child widget with `PolarTabPage` to save UI state on each navigation

Then you can use `PolarTabBar` on your widget

```dart
Scaffold(
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
                type: PolarTabType.pill, // Default Type
                tabs: tabs
            ),
        ),
    ),
)
```

## Customization

- `type` (Default: `PolarTabType.pill`) - Type of tab bar
- `pageController` (Optional) - Provide if you want full control of the internal `PageView`
- `height` (Optional) - Provide height if you use `PolarTabBar` inside Scrolling parent (`ListView`, `SingleChildScrollView`, or else)
- `contentSpacing` - Spacing on each tab items
- `innerPadding` - Spacing inside tab's pill
- `radius` - Tab item's border radius
- `background` (Optional) - Inactive background color of tab's pill
- `activeBackground` (Optional) - Active background color of tab's pill
- `titleStyle` (Optional) - TextStyle of inactive title
- `activeTitleStyle` (Optional) - TextStyle of active title
- `isDense` () - Make the tab more compact
- `curve` - Animation's curve
- `duration` (Default: `300ms`) - Animation's duration
- `swipable` (Default: `true`) - Make `PageView` swipable
