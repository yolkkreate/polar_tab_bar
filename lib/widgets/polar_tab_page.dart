import 'package:flutter/widgets.dart';

class PolarTabPage extends StatefulWidget {
  final Widget child;
  final bool reserveState;

  const PolarTabPage({
    super.key,
    required this.child,
    this.reserveState = true,
  });

  @override
  State<PolarTabPage> createState() => _PolarTabPageState();
}

class _PolarTabPageState extends State<PolarTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.reserveState;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }
}
