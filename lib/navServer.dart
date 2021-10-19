import 'package:flutter/material.dart';

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
            return Container(
              width: 48,
              height: 48,
              child: Icon(server.icon),
            );
          },
        ),
      );
    },
  );
}

// Get a list of the user's servers
Future<List<Server>> getServerList() async {
  List<Server> serverList = new List.generate(
    50,
    (i) => Server("test2", Icons.add),
  );
  return serverList;
}

class Server {
  String name;
  IconData icon;
  Server(this.name, this.icon);
}
