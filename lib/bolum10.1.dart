/*  ---------- AÇIKLAMA -----------------

Bu bölümde Ekranlar arası geçiş için
navigator.push ve navigator.pop komutlarını kullandım basit bir örnekle.



 */
import 'package:flutter/material.dart';

void main(){
  runApp(Bolum10_1());
}

class Bolum10_1 extends StatefulWidget {
  const Bolum10_1({super.key});

  @override
  State<Bolum10_1> createState() => _Bolum10_1State();
}

class _Bolum10_1State extends State<Bolum10_1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sayfa1(),
    );
  }
}

class Sayfa1 extends StatelessWidget {
  const Sayfa1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("EKRAN 1"),
      ),
      body: Center(child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange
          ) ,
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sayfa2(),)
            );
          } ,
          child: Text(
              "2. EKRANA GEÇ",
            style: TextStyle(
              color: Colors.white
            ),
          )
        )
      ),


    );
  }
}


class Sayfa2 extends StatelessWidget {
  const Sayfa2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("EKRAN 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 400,
                child: Image.network("https://st.depositphotos.com/67903508/59949/i/950/depositphotos_599493982-stock-photo-vertical-shot-bosphorus-bridge-sunset.jpg")
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange
                ) ,
                onPressed: (){
                  Navigator.pop(context);
                } ,
                child: Text(
                  "1. EKRANA GEÇ",
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
            ),
          ],
        ),
      ),


    );
  }
}


