/*

Bu bölümde flutterdaki bazı temel widgetları uygulamaya çalıştım.
önceki bölümlerdeki çalışmalardan farklı olarak:

- singlechildscrollview widgetını
- drawer widgetını,
- pageview widgetını


*/
import 'package:flutter/material.dart';

void main(){
  runApp(Bolum12());
}

class Bolum12 extends StatefulWidget {
  const Bolum12({super.key});

  @override
  State<Bolum12> createState() => _Bolum12State();
}

class _Bolum12State extends State<Bolum12> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ekran1(),
    );
  }
}


class Ekran1 extends StatefulWidget {
  const Ekran1({super.key});

  @override
  State<Ekran1> createState() => _Ekran1State();
}

class _Ekran1State extends State<Ekran1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                },
              icon: Icon(
                  Icons.account_circle,
                color: Colors.black,
              )
          )
        ],
        backgroundColor: Colors.lightGreenAccent,
        title: Center(
          child: Text(
              "EKRAN 1",
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            golgeliResim(yukseklik: 200,genislik: 300),
            SizedBox(
              height: 25,
            ),
            kayanEkran(),
            SizedBox(
              height: 15,
            ),
            listviewKismi(),
            SizedBox(
              height: 25,
            ),
            golgeliResim(yukseklik: 150,genislik: 225),
            SizedBox(
              height: 25,
            ),
            golgeliResim(yukseklik: 150,genislik: 180),
            SizedBox(
              height: 25,
            ),
            golgeliResim(yukseklik: 100,genislik: 150),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      drawer: drawer(),
    );
  }
}

class listviewKismi extends StatelessWidget {
  const listviewKismi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: 448,
      height: 273,
      child: Stack(
        children: [

        ],
      ),
    );
  }
}

class kayanEkran extends StatefulWidget {
  const kayanEkran({
    super.key,
  });

  @override
  State<kayanEkran> createState() => _kayanEkranState();
}

class _kayanEkranState extends State<kayanEkran> {

  final _ekranKontrol = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhysicalModel(
          color: Colors.black45,
          elevation: 15,
          child: Container(
            padding: EdgeInsets.all(10),
            width: 380,
            height: 200,
            child: PageView(
              //physics: NeverScrollableScrollPhysics(),
              controller: _ekranKontrol,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 180,
                  width: 360,
                  color: Colors.red,
                  child: Center(child: Text(
                    "SAYFA 1",
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.white
                    ),

                  )
                  ),
                ),
                Container(
                  height: 180,
                  width: 360,
                  color: Colors.white,
                  child: Center(child: Text(
                    "SAYFA 2",
                    style: TextStyle(
                      fontSize: 34,
                        color: Colors.black
                    ),

                  )
                  ),
                ),
                Container(
                  height: 180,
                  width: 360,
                  color: Colors.indigo,
                  child: Center(child: Text(
                    "SAYFA 3",
                    style: TextStyle(
                        fontSize: 34,
                        color: Colors.white
                    ),

                  )
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                    _ekranKontrol.previousPage(duration: Duration(milliseconds: 300 ), curve: Curves.linear);
                },
                child: Text("ÖNCEKİ SAYFA")
            ),
            SizedBox(
              width: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  _ekranKontrol.nextPage(duration: Duration(milliseconds: 300 ), curve: Curves.linear);
                },
                child: Text("ÖNCEKİ SAYFA")
            ),
          ],
        ),

      ],
    );
  }
}



class golgeliResim extends StatelessWidget {
  const golgeliResim({
    required this.yukseklik,
    required this.genislik,
    super.key,
  });

  final int genislik;
  final int yukseklik;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white54,
      elevation: 15,
      child: ClipRRect(
        child: Container(
          height: yukseklik.toDouble(),
          width: genislik.toDouble(),
          child: Image.network("https://picsum.photos/100"),
          //color: Colors.blueGrey,
        ),
      ),
    );
  }
}



class drawer extends StatelessWidget {
  const drawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.

        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightGreenAccent),
            child: Text(
                'Drawer Header',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ),
          ListTile(

            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),

    );
  }
}
