// BOLUM 6

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(
            child: Text("AppBar", style: TextStyle(color: Colors.black)),
          ),
          leading: Icon(Icons.menu),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {  },), Icon(Icons.ac_unit)],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("test"),
              ElevatedButton(onPressed: () {}, child: Text("buton")),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "bir"),
            BottomNavigationBarItem(icon: Icon(Icons.remove), label: "iki"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
