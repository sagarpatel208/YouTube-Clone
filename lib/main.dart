import 'package:flutter/material.dart';
import 'package:youtube_clone/components/explore_component.dart';
import 'package:youtube_clone/components/feed_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.black),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: const [
            FlutterLogo(size: 20),
            SizedBox(width: 10),
            Text(
              "YouTube",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast_sharp,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const ExploreComponent(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey.shade400,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 7),
          ),
          const SizedBox(height: 10),
          const Expanded(child: FeedComponent())
        ],
      ),
    );
  }
}
