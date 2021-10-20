import 'package:flutter/material.dart';

import 'package:grumble/widgets/nav_drawer/channels.dart';
import 'package:grumble/widgets/nav_drawer/servers.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: serverListBuilder(context),
          ),
          Expanded(
            flex: 4,
            child: channelListBuilder(context),
          ),
        ],
      ),
    );
  }
}