/*  ---------- AÇIKLAMA -----------------

Bu bölümde önceki örnekteki versiyondan farklı olarak :

async ve await kullanarak future ile yapılan işi daha basit hale
getiren küçük bir örnek yaptım.


 */
import 'dart:ffi';

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
          ),
          onPressed: () {
            sor(context);
          },
          child: Text(
            "2. EKRANA GEÇ",
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),


      ),
    );
  }

  Future<void> sor(BuildContext context) async {
    try {
      bool? cevap = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Sayfa2("Görseli beğendiniz mi ? "),)
      );

      if (cevap==true){
        print("beğendi");
      }
      else{
        await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Sayfa2("Keşke beğenseydiniz ... Görseli beğendiniz mi ? "),)
        );
      }
      if(cevap==true){
        print("beğendiniz");
      }
      else{
        print("beğenmediniz");
      }
      print("----------- iş bitti -----------");
    } catch (e) {
      print("hata");
    }
  }
}

class Sayfa2 extends StatelessWidget {

  final String mesaj;
  const Sayfa2(
      String this.mesaj,
      {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("pop edilecek");
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text("EKRAN 2"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                height: 400,
                // child: Image.network("https://st.depositphotos.com/67903508/59949/i/950/depositphotos_599493982-stock-photo-vertical-shot-bosphorus-bridge-sunset.jpg")
              ),
              SizedBox(
                height: 25,
              ),
              Text(mesaj),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                  ) ,
                  onPressed: (){
                    Navigator.of(context).pop(true);
                  } ,
                  child: Text(
                    "EVET",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange
                  ) ,
                  onPressed: (){
                    Navigator.of(context).pop(false);
                  } ,
                  child: Text(
                    "HAYIR",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


