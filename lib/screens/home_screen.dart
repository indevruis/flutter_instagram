import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
        ],
      ),
      body: [
        Home(),
        Text('Search'),
        Text('Post'),
        Text('Reels'),
        Text('Profile')
      ][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: 'box'),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined), label: 'video'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
          ]),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12.0),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'indevruis',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ]),
                      Icon(Icons.more_horiz)
                    ],
                  ),
                ),
                Image.asset('assets/images/dev-jeans.png'),
                Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border_outlined)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.mode_comment_outlined)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.send)),
                          ],
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.bookmark_outline))
                      ],
                    )),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ruirun님 외 100명이 좋아합니다.'),
                      Text('indevruis dev jeans'),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
