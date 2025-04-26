import 'package:flutter/material.dart';

void main() {
  runApp(Bolum7());
}

class Bolum7 extends StatefulWidget {
  @override
  State<Bolum7> createState() => _Bolum7State();
}


class _Bolum7State extends State<Bolum7> {

  int aktifButon = 0;
  TextEditingController controller = TextEditingController();
  String yazi = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      setState(() {
        yazi = controller.text;
      });
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Bolum7 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: aktifButon == 0 ? () {
                setState(() {
                  aktifButon = (aktifButon+1) % 3;
                });
              } : null,
              child: Text("1")),
              ElevatedButton(onPressed: aktifButon == 1 ? () {
                setState(() {
                  aktifButon = (aktifButon+1) % 3;
                });
              } : null,
                  child: Text("2")),
              ElevatedButton(onPressed: aktifButon == 2 ? () {
                setState(() {
                  aktifButon = (aktifButon+1) % 3;
                });
              } : null,
                  child: Text("3")),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (){
                        controller.text= "";
                      },
                      icon: Icon(Icons.remove_circle))
                ),
              ),
              Text("$yazi")

            ],
          ),
        ),
      ),
    );
  }
}
