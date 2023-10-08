import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        body: Text(''));
  }
}
