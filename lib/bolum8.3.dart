/*  ---------- AÇIKLAMA -----------------

bolum 8.2 de widgetlar arasındaki veri transferini constrcutorlar aracılığıyla
yapmıştık bu bölümde inherited widget kullanarak alt sınıf ile üst sınıf arasında
iletişim kurulmasını sağlayacağız.



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
      ogrenciler = [...ogrenciler, yeniOgrenci];
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
        body: SinifBilgisi(
            baslik: baslik,
            ogrenciler: ogrenciler,
            yeniOgrenciEkle : yeniOgrenciEkle,
            child: sinif(),
        ),
      ),
    );
  }
}

class SinifBilgisi extends InheritedWidget {
  const SinifBilgisi({
    super.key,
    required this.child,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,

  }) : super(child: child);

  final Widget child;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  static SinifBilgisi of(BuildContext context) {
    final SinifBilgisi? result = context.dependOnInheritedWidgetOfExactType<SinifBilgisi>();
    assert(result != null, 'No SinifBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SinifBilgisi old) {
    return baslik != old.baslik ||
    ogrenciler != old.ogrenciler ||
    yeniOgrenciEkle != old.yeniOgrenciEkle;
  }
}

class sinif extends StatelessWidget {
  const sinif({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sinifbilgisi = SinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.star),
            Text(
              sinifbilgisi.baslik,
              style: TextStyle(
                fontSize: 45,
              ),
            ),
            Icon(Icons.star),
          ],
        ),
        sinifListesi(),
        ogrenciEkleme(),
      ],
    );
  }
}

class sinifListesi extends StatelessWidget {
  const sinifListesi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sinifbilgisi = SinifBilgisi.of(context);
    return Column(
      children: [
        for(var o in sinifbilgisi.ogrenciler)(
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
  });


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
    final sinifbilgisi = SinifBilgisi.of(context);
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
              sinifbilgisi.yeniOgrenciEkle(yenieleman);
              controller.text = "";
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
