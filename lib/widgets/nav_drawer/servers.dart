import 'package:flutter/material.dart';
import 'package:grumble/models/server.dart';
import 'package:grumble/pages/server/view.dart';

serverListBuilder(BuildContext context) {
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

// Get a list of the user's servers
Future<List<Server>> getServerList() async {
  List<Server> serverList = List.generate(
    50,
    (i) => Server(i.toString(), 'Server #${i}', Icons.add),
  );
  return serverList;
}
