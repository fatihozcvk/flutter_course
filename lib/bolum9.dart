/*  ---------- AÇIKLAMA -----------------

Bu bölümde stack kullanarak ekran yerleşimi yapmanın çok basic bir örneği, positioned kullanarak
widgetları hizalamayı ve internetten resim eklemeyi gösteren bir çalışma yaptım.



 */

import 'package:flutter/material.dart';

void main() {
  runApp(Bolum9());
}

class Bolum9 extends StatefulWidget {
  const Bolum9({super.key});

  @override
  State<Bolum9> createState() => _Bolum9State();
}

class _Bolum9State extends State<Bolum9> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Bolum 9"), backgroundColor: Colors.lightGreenAccent),
        body: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.lightGreenAccent,
                width: 400,
                height: 600,
              ),
              Positioned(
                top: 35,
                left: 35,
                right: 35,
                child: Container(
                  color: Colors.white,
                  width: 350,
                  height: 200,
                  child: Image.network(
                    "https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png",  // URL doğru yere taşındı
                  ),
                ),
              ),
              Positioned(
                  bottom: 30,
                  left: 158,
                  child: ElevatedButton(onPressed: (){}, child: Text("buton"))),
            ],
          ),
        ),
      ),
    );
  }
}
