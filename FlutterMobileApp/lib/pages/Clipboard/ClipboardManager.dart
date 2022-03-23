import 'package:app_flutter/Models/Clip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class ClipboardManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClipboardManagerState();
  }
}

class ClipboardManagerState extends State<ClipboardManager> {
  Widget clipLayout(Clip clip) {
    final date = clip.dateTime;
    final timeAgoFormat = timeago.format(DateTime.now().subtract(new Duration(minutes:date.minute )));
    return Card(
      margin: EdgeInsets.all(5),
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              Expanded(child: clip.title.isEmpty ? Container() : Text(clip.title,maxLines: 1,),flex:4),

              Expanded(child: Text(timeAgoFormat),flex:2)
            ],
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            clip.clipdata,
            maxLines: 3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Clip clip1 = Clip("This a large title, very very large title",
        "Hello there how are you all doing. Hope everyone is fine.",
        DateTime.now());
    Clip clip2 = Clip("",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        DateTime.now());
    return SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [clipLayout(clip1), clipLayout(clip2)],
                ),
              ),
            )
          ],
        ));
  }
}
