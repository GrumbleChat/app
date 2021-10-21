import 'package:flutter/cupertino.dart';

class Channel extends ChangeNotifier {
  String name;
  Channel(this.name);
}

// Get a list of the user's servers
Future<List<Channel>> getChannelList() async {
  List<Channel> channelList = List.generate(50,
    (i) => Channel("test2"),
  );
  return channelList;
}