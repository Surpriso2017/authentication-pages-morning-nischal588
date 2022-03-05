import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  List<String> postTitles = [
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
    "https://clipart-best.com/img/mario/mario-clip-art-5.png",
  ];
  String title = "";
  late TabController customTabController;
  bool visibility = false;
  String image = 'https://www.tutorialkart.com/img/hummingbird.png';
  List list = [
    "Chloe West",
    "Content Marketing Manager at @vismeapp and Freelance",
    "Marketing Writer",
    "Charleston, SC",
    "chloesocial.com"
  ];

  @override
  void initState() {
    super.initState();
    customTabController = TabController(length: 2, vsync: this);
  }

  List<Widget> stringList() {
    return List.generate(list.length, (index) {
      final currentList = list[index];
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Text(
            currentList,
            textAlign: TextAlign.left,
          ),
        ),
      );
    });
  }

  buildFirstSectio() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: NetworkImage(
                        'https://www.tutorialkart.com/img/hummingbird.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("1045", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("1045", style: TextStyle(fontSize: 20)),
                          SizedBox(
                            width: 10,
                          ),
                          Text("1045", style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 14,
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text("Followers", style: TextStyle(fontSize: 12)),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Following", style: TextStyle(fontSize: 12)),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(children: stringList()),
          )
        ],
      ),
    );
  }

  buildFollowContainer(bool value, String Btitle) {
    return Visibility(
        visible: value,
        child: Btitle == "Follow"
            ? Container(
                height: 30,
                child: Row(
                  children: [
                    Icon(Icons.tv),
                    Icon(Icons.facebook),
                  ],
                ),
              )
            : Container(
                height: 30,
                child: Row(
                  children: [Text("Message")],
                ),
              ));
  }

  buildHorizontalTabBarSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: MaterialButton(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1, color: Colors.grey, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
              hoverColor: Colors.blue,
              onPressed: () {
                if (visibility == true) {
                  visibility = false;
                } else {
                  visibility = true;
                }
                title = "Follow";
                setState(() {});
              },
              child: const Text("Follow"),
            )),
            SizedBox(width: 10),
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1, color: Colors.grey, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                hoverColor: Colors.blue,
                onPressed: () {
                  if (visibility == true) {
                    visibility = false;
                  } else {
                    visibility = true;
                  }
                  title = "Message";
                  setState(() {});
                },
                child: const Text("Message"),
              ),
            )
          ],
        ),
        buildFollowContainer(visibility, title)
      ],
    );
  }

  buildTabBarSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: customTabController,
                indicatorColor: Colors.black,
                indicatorWeight: 3,
                tabs: [Icon(Icons.grid_4x4), Icon(Icons.contact_page)]),
          ),
          Container(
            height: 400,
            child: TabBarView(controller: customTabController, children: [
              buildGridViewSection(postTitles),
              buildGridViewSection(postTitles)
            ]),
          )
        ],
      ),
    );
  }

  buildGridViewSection(List postTitles) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        child: GridView.builder(
            itemCount: postTitles.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 2.0, crossAxisSpacing: 2.0),
            itemBuilder: (context, index) {
              final currentValue = postTitles[index];
              return Container(
                color: Colors.grey,
                child: Image.network(currentValue),
              );
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Chloewest28"),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          backgroundColor: Colors.grey[300],
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ))
          ],
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildFirstSectio(),
              SizedBox(
                height: 20,
              ),
              buildHorizontalTabBarSection(),
              SizedBox(height: 20),
              buildTabBarSection(),
            ],
          ),
        ));
  }
}
