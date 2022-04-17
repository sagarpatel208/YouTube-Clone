import 'package:flutter/material.dart';
import 'package:youtube_clone/utilities/data_source.dart';

class FeedComponent extends StatefulWidget {
  const FeedComponent({Key? key}) : super(key: key);

  @override
  State<FeedComponent> createState() => _FeedComponentState();
}

class _FeedComponentState extends State<FeedComponent> {
  List feedList = DataSource.feedData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feedList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: FeedWidget(feedData: feedList[index]),
        );
      },
    );
  }
}

class FeedWidget extends StatelessWidget {
  FeedWidget({Key? key, required this.feedData}) : super(key: key);
  Map feedData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          feedData['cover_image'],
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        ListTile(
          leading: ClipOval(
            child: Image.asset(
              feedData['user_image'],
              height: 50,
            ),
          ),
          title: Text(
            feedData['title'],
            style: const TextStyle(fontSize: 17),
          ),
          subtitle: Text(feedData['descrption']),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MoreOptionWidget(
                          icon: Icons.access_time,
                          text: "Save to Watch Later",
                        ),
                        MoreOptionWidget(
                          icon: Icons.add_to_photos_outlined,
                          text: "Save to playlist",
                        ),
                        MoreOptionWidget(
                          icon: Icons.share,
                          text: "Share",
                        ),
                        MoreOptionWidget(
                          icon: Icons.block,
                          text: "Not interested",
                        ),
                        MoreOptionWidget(
                          icon: Icons.delete_outline,
                          text: "Don't recommend channel",
                        ),
                        MoreOptionWidget(
                          icon: Icons.flag_outlined,
                          text: "Report",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.grey.shade400,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 3),
                        ),
                        MoreOptionWidget(
                          icon: Icons.clear,
                          text: "Cancel",
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class MoreOptionWidget extends StatelessWidget {
  MoreOptionWidget({Key? key, required this.icon, required this.text})
      : super(key: key);
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}
