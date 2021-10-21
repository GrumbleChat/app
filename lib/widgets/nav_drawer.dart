import 'package:flutter/material.dart';
import 'package:grumble/models/channel.dart';
import 'package:grumble/models/server.dart';
import 'package:grumble/pages/server/view.dart';

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
            child: _buildServerList(context),
          ),
          Expanded(
            flex: 4,
            child: _buildChannelList(context),
          ),
        ],
      ),
    );
  }
}

_buildChannelList(BuildContext context) {
  return FutureBuilder(
    future: getChannelList(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      // progress bar
      if (snapshot.connectionState == ConnectionState.none &&
          !snapshot.hasData) {
        return Text('No data');
      }
      // render data
      return Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            Channel channel = snapshot.data[index];
            return ListTile(title: Text(channel.name));
          },
        ),
      );
    },
  );
}

_buildServerList(BuildContext context) {
  return FutureBuilder(
    future: getServerList(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      // progress bar
      if (snapshot.connectionState == ConnectionState.none &&
          !snapshot.hasData) {
        return Text('No data');
      }
      // render data
      return Container(
        color: Colors.red,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            Server server = snapshot.data[index];
            return GestureDetector(
              child: Container(width: 48, height: 48, child: Icon(server.icon)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServerHomePage(),
                    settings: RouteSettings(arguments: server),
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}
