import 'package:flutter/material.dart';
import 'package:grumble/widgets/adaptive_scaffold.dart';
import 'package:grumble/widgets/nav_drawer/main.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(title: Text('How did you get here?')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
