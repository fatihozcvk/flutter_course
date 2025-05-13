/*  ---------- AÇIKLAMA -----------------

Bu bölümde önceki örnekteki versiyondan farklı olarak :

sayfalar arası geçişte init fonksiyon ile başlatılan asenkron
bir fonksiyon çalıştırdım. Stateful ile asenkron ilişkisini
state yardımı ile basit şekilde uygulamış oldum.


 */

import 'package:flutter/material.dart';


void main(){
  runApp(Bolum11());
}

class Bolum11 extends StatefulWidget {
  const Bolum11({super.key});

  @override
  State<Bolum11> createState() => _Bolum11State();
}

class _Bolum11State extends State<Bolum11> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sayfa_1(),
    );
  }
}

class Sayfa_1 extends StatefulWidget {
  const Sayfa_1({super.key});

  @override
  State<Sayfa_1> createState() => _Sayfa_1State();
}

class _Sayfa_1State extends State<Sayfa_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
            "SAYFA 1",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo
            ),
            onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Sayfa_2(),
                      )
                  );
            },
            child: Text(
                "ASENKRON SAYFASINA GEÇİŞ",
              style: TextStyle(
                color: Colors.white
              ),
            )
        ),
      ),
    );
  }
}

// SAYFA 2 --------------------------------------------------------------------------------

class Sayfa_2 extends StatefulWidget {
  const Sayfa_2({super.key});

  @override
  State<Sayfa_2> createState() => _Sayfa_2State();

}

class _Sayfa_2State extends State<Sayfa_2> {


  bool? yukleniyor = false;
  String? resimYolu = "";

  @override
  void initState() {
    yukle();
    super.initState();
  }

  Future<void> yukle() async {
    setState(() {
      yukleniyor = true;
      resimYolu = "";
    });

    try{
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        resimYolu = "https://picsum.photos/250";
      });
    }
    catch(e){
      print(e);
    }
    finally{
      setState(() {
        yukleniyor = false;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    if(yukleniyor!){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "SAYFA 2",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: Center(
            child: CircularProgressIndicator(),
        ),
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            "SAYFA 2",
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
        body: Center(child: Image.network(resimYolu!)),
      );

    }
  }


}

