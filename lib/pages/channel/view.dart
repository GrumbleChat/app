import 'package:flutter/material.dart';
import 'package:grumble/models/channel.dart';
import 'package:grumble/widgets/nav_drawer/main.dart';

class ChannelViewPage extends StatelessWidget {
  ChannelViewPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(title: Text('This should be a wall of messages.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
