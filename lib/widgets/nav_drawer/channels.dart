import 'package:flutter/material.dart';
import 'package:grumble/models/channel.dart';

channelListBuilder(BuildContext context) {
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

// Get a list of the user's servers
Future<List<Channel>> getChannelList() async {
  List<Channel> channelList = List.generate(50,
    (i) => Channel("test2"),
  );
  return channelList;
}
