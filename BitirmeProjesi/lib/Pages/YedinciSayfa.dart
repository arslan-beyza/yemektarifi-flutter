// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/GirisEkrani.dart';
import 'package:login_harita/Pages/AltinciSayfafilter.dart';

class YedinciSayfa extends StatefulWidget {
  const YedinciSayfa({Key? key}) : super(key: key);

  @override
  State<YedinciSayfa> createState() => _YedinciSayfaState();
}

class _YedinciSayfaState extends State<YedinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network("${subtest.docs[selected_recipe]["resim"]}"),
              Text("${subtest.docs[selected_recipe]["isim"]}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Malzemeler :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Text('${subtest.docs[selected_recipe]["malzemeler"]}'),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tarif :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Text('${subtest.docs[selected_recipe]["tarif"]}'),
            ],
          ),
        ),
      ),
    );
  }
}
