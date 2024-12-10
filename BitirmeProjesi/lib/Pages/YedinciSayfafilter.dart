// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/GirisEkrani.dart';
import 'package:login_harita/Pages/AltinciSayfafilter.dart';

class YedinciSayfaFilter extends StatefulWidget {
  final List subdata;
  final int selected_recipe;
  const YedinciSayfaFilter(
      {Key? key, required this.subdata, required this.selected_recipe})
      : super(key: key);

  @override
  State<YedinciSayfaFilter> createState() => _YedinciSayfaFilterState();
}

class _YedinciSayfaFilterState extends State<YedinciSayfaFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("yedi numaralı sayfa"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(
                  "${widget.subdata[widget.selected_recipe]["resim"]}"),
              Text("${widget.subdata[widget.selected_recipe]["isim"]}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Malzemeler :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Text('${widget.subdata[widget.selected_recipe]["malzemeler"]}'),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tarif :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Text('${widget.subdata[widget.selected_recipe]["tarif"]}'),
            ],
          ),
        ),
      ),
    );
  }
}
