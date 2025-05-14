/*
Bu bölümde yeni öğrendiğim bazı widgetları kullandım
- checkbox radio slider gibi widgetları

Ek olarak çoklu girdi elemanı olan yapıda verileri kontrol etmemizi
Sağlayan Form yapısınu kullandım,

örneğin textfield boşsa uyarı verecek.


*/
import 'package:flutter/material.dart';


void main(){
  runApp(Bolum13());
}

class Bolum13 extends StatefulWidget {
  const Bolum13({super.key});

  @override
  State<Bolum13> createState() => _Bolum13State();
}

class _Bolum13State extends State<Bolum13> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Giris(),
    );
  }
}

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

enum Cinsiyet{
  erkek,
  kadin,
  bos,
}

const Okullar = ["ilkokul", "ortaokul", "üniversite"];

class _GirisState extends State<Giris> {

  bool? checkbox = false;
  Cinsiyet cinsiyet = Cinsiyet.bos;
  double boy = 100;
  TextEditingController textfieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();       // bu form için gerekli

  @override
  void dispose() {
    textfieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Center(child: Text("FORM"),
        )
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: checkbox,
                      onChanged:(value) {
                        if(value == null){
                          setState(() {
                            checkbox = value;
                          });
                        }
                      },
                    ),
                    Text(
                      checkbox == true ? "evet, okulda" : " hayır, okulda değil")
                  ],
                ),
                Radio<Cinsiyet>(
                    value: Cinsiyet.erkek,
                    groupValue: cinsiyet,
                    onChanged: (value) {
                      setState(() {
                          cinsiyet = value!;
                      });
                    },
                ),
                Radio<Cinsiyet>(
                    value: Cinsiyet.kadin,
                    groupValue: cinsiyet,
                    onChanged: (value) {
                      setState(() {
                        cinsiyet = value!;
                      });
                    },
                ),
                Text(cinsiyet.toString()),
                Slider(
                    min: 30,
                    max: 300,
                    value: boy,
                    onChanged: (value) {
                      setState(() {
                        boy = value;
                      });
                    },
                ),
                Text(boy.toStringAsFixed(2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Bir metin girin ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Boş bırakılamaz!';
                      }
                      return null; // valid ise
                    },
                    controller: textfieldController,
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                  ),
                ),
                Text(textfieldController.text,),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        checkbox = false;
                        cinsiyet = Cinsiyet.bos;
                        boy = 100;
                        textfieldController.text = "";
                      });
                    },
                    child: Text("FORMU TEMİZLE")
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                        final icerikuygunmu  = formKey.currentState?.validate();
                        if(icerikuygunmu == true){
                          formKey.currentState?.save();
                          print("uygun");
                        }
                        // tekrardan sıfırlamak için
                        setState(() {
                          checkbox = false;
                          cinsiyet = Cinsiyet.bos;
                          boy = 100;
                          textfieldController.text = "";
                        });

        
                    },
                    child: Text("GÖNDER")
                ),
              ],
          ),
        ),
      ),
    );
  }
}
