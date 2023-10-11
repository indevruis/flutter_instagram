import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  List datas = [];

  getData() async {
    var data = await http
        .get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    List result = jsonDecode(data.body);
    setState(() {
      datas = result;
    });
  }

  addData(data) {
    setState(() {
      datas.add(data);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
        Home(
          datas: datas,
          addData: addData,
        ),
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

class Home extends StatefulWidget {
  final List datas;
  var addData;
  Home({required this.datas, required this.addData, Key? key})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  getNewData() async {
    var newData = await http
        .get(Uri.parse("https://codingapple1.github.io/app/more2.json"));
    var result = jsonDecode(newData.body);
    widget.addData(result);
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        getNewData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.datas.isNotEmpty) {
      return ListView.builder(
          controller: scroll,
          itemCount: widget.datas.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.person),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              widget.datas[index]['user'],
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ]),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ),
                  Image.network(widget.datas[index]['image'],
                      width: double.infinity),
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
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '~님 외 ${widget.datas[index]['likes'] - 1}명이 좋아합니다.'),
                        Text(
                            '${widget.datas[index]['user']} ${widget.datas[index]['content']}'),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
