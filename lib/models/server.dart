import 'package:flutter/material.dart';

class Server extends ChangeNotifier {
  Server(this.id, this.name, this.icon);
  String id;
  String name;
  IconData icon;
}

// Get a list of the user's servers
Future<List<Server>> getServerList() async {
  List<Server> serverList = List.generate(
    50,
    (i) => Server(i.toString(), 'Server #${i}', Icons.add),
  );
  return serverList;
}