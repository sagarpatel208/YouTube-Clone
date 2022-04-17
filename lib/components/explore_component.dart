import 'package:flutter/material.dart';

class ExploreComponent extends StatefulWidget {
  const ExploreComponent({Key? key}) : super(key: key);

  @override
  State<ExploreComponent> createState() => _ExploreComponentState();
}

class _ExploreComponentState extends State<ExploreComponent> {
  List exploreCategory = [
    "All",
    "Dart",
    "Flutter",
    "Firebase",
    "SQLite",
    "Google"
  ];
  int selectedExploreCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(top: 7),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.white38),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.explore_outlined),
                SizedBox(width: 7),
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            color: Colors.grey.shade700,
            margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: exploreCategory.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedExploreCategoryIndex = index;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: selectedExploreCategoryIndex == index
                          ? Colors.black54
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.white38),
                    ),
                    child: Center(
                      child: Text(
                        "${exploreCategory[index]}",
                        style: TextStyle(
                          fontSize: 15,
                          color: selectedExploreCategoryIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({Key? key}) : super(key: key);

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
