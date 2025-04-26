import 'package:flutter/material.dart';

void main(){
  runApp(Bolum8());
}

class Bolum8 extends StatefulWidget {
  const Bolum8({super.key});

  @override
  State<Bolum8> createState() => _Bolum8State();
}

class _Bolum8State extends State<Bolum8> {

  String baslik = "LIST";
  List<String> ogrenciler = ["fatih", "baris", "ismail"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.star),
                Text(
                    baslik,
                    style: TextStyle(
                      fontSize: 45,
                    ),
                ),
                Icon(Icons.star),
              ],
            ),
            for(var o in ogrenciler)(
              Text(
                o,
                style: TextStyle(
                fontSize: 22,
              ),)
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    ogrenciler.add("yeni isim");
                  });

                },
                child: Text(
                  "EKLE",
                  style: TextStyle(
                    fontSize: 22,
                  ),

                )
            ),
          ],
        ),
      ),
    );
  }
}
