import 'package:flutter/material.dart';

class Server extends ChangeNotifier {
  Server(this.id, this.name, this.icon);
  String id;
  String name;
  IconData icon;
}