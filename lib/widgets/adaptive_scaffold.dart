import 'package:flutter/material.dart';
import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';

bool _isLargeScreen(BuildContext context) =>
    getWindowType(context) >= AdaptiveWindowType.large;
bool _isMediumScreen(BuildContext context) =>
    getWindowType(context) == AdaptiveWindowType.medium;

enum NavigationType {
  drawer,
  permanentDrawer,
}

NavigationType _navigationTypeResolver(BuildContext context) {
  if (_isLargeScreen(context) || _isMediumScreen(context)) {
    print("perm drawer");
    return NavigationType.permanentDrawer;
  } else {
    print("shitty drawer");
    return NavigationType.drawer;
  }
}

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    Key? key,
    this.appBar,
    required this.body,
    required this.drawer,
  }) : super(key: key);

  // See [Scaffold.appBar].
  final PreferredSizeWidget? appBar;

  // See [Scaffold.body].
  final Widget body;

  // See [Scaffold.drawer]
  final Widget drawer;

  Widget _buildCollapsibleDrawerScaffold() {
    return Scaffold(
      body: body,
      appBar: appBar,
      drawer: drawer,
      primary: true,
    );
  }

  Widget _buildPermanentDrawerScaffold() {
    return Row(
      children: [
        drawer,
        const VerticalDivider(
          width: 1,
          thickness: 1,
        ),
        Expanded(
          child: Scaffold(
            appBar: appBar,
            body: body,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationType = _navigationTypeResolver(context);
    switch (navigationType) {
      case NavigationType.drawer:
        return _buildCollapsibleDrawerScaffold();
      case NavigationType.permanentDrawer:
        return _buildPermanentDrawerScaffold();
    }
  }
}
