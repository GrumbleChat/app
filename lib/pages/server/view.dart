import 'package:flutter/material.dart';
import 'package:grumble/models/server.dart';
import 'package:grumble/widgets/adaptive_scaffold.dart';
import 'package:grumble/widgets/nav_drawer/main.dart';

class ServerHomePage extends StatelessWidget {
  ServerHomePage({Key? key}) : super(key: key);

  static const routeName = '/serverHomePage2';

  Widget build(BuildContext context) {
    final server = ModalRoute.of(context)!.settings.arguments as Server;

    return AdaptiveScaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text(server.name)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('No idea what actually goes on this page... yet'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
