/*  ---------- AÇIKLAMA -----------------

Bu bölümde, tek class içerisinde birden çok widget olduğunda class ağırlaşacağı için
widgetları ayrı classlara ayırdık ve bu alt üst widget arasında constuctor parametreleri ile
veri gönderdik.



 */

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

  void yeniOgrenciEkle(String yeniOgrenci){
    setState(() {
      ogrenciler.add(yeniOgrenci);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: sinif(
            baslik: baslik,
            ogrenciler: ogrenciler,
            yeniOgrenciEkle : yeniOgrenciEkle
        ),
      ),
    );
  }
}

class sinif extends StatelessWidget {
  const sinif({
    super.key,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,
  });

  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        sinifListesi(ogrenciler: ogrenciler),
        ogrenciEkleme(yeniOgrenciEkle : yeniOgrenciEkle),
      ],
    );
  }
}

class sinifListesi extends StatelessWidget {
  const sinifListesi({
    super.key,
    required this.ogrenciler,
  });

  final List<String> ogrenciler;

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      for(var o in ogrenciler)(
          Text(
            o,
            style: TextStyle(
              fontSize: 22,
            ),
          )
      ),
    ],
    );
  }
}

class ogrenciEkleme extends StatefulWidget {
  const ogrenciEkleme({
    super.key,
    required this.yeniOgrenciEkle,
  });

  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  State<ogrenciEkleme> createState() => _ogrenciEklemeState();
}

class _ogrenciEklemeState extends State<ogrenciEkleme> {

  TextEditingController controller = TextEditingController();
  late String yenieleman;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            setState(() {

            });
          },
        ),
        ElevatedButton(
            onPressed: controller.text.isEmpty ? null :(){
              yenieleman = controller.text;
              widget.yeniOgrenciEkle(yenieleman);
              controller.text = "";

              //  setState(() {
              //   ogrenciler.add("yeni isim");
              //   });
            },
            child: Text(
              "EKLE",
              style: TextStyle(
                fontSize: 22,
              ),

            )
        ),
      ],
    );
  }
}
