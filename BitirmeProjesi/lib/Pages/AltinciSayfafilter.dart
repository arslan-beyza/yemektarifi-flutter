// ignore_for_file: prefer_const_constructors, camel_case_types
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/GirisEkrani.dart';
import 'package:login_harita/Pages/YedinciSayfafilter.dart';
import 'YedinciSayfa.dart';

var selected_recipe = 0;

class AltinciSayfafilter extends StatefulWidget {
  final List selectedvalues;
  const AltinciSayfafilter({Key? key, required this.selectedvalues})
      : super(key: key);

  @override
  State<AltinciSayfafilter> createState() => _AltinciSayfafilterState();
}

class _AltinciSayfafilterState extends State<AltinciSayfafilter> {
  List<Map<String, dynamic>> subdata = [];
  bool isloading = true;
  List<Map<String, dynamic>> removeDuplicates(
      List<Map<String, dynamic>> originalList, String field) {
    List<String> keys = [];
    List<Map<String, dynamic>> uniqueList = [];

    for (var item in originalList) {
      if (!keys.contains(item[field])) {
        keys.add(item[field]);
        uniqueList.add(item);
      }
    }

    return uniqueList;
  }

  getdata() async {
    doc = await FirebaseFirestore.instance.collection('tarif').get();
    for (int i = 0; i < doc.docs.length; i++) {
      subtest = await FirebaseFirestore.instance
          .collection('tarif')
          .doc(doc.docs[i].id)
          .collection('tarifler')
          .get();
      for (int k = 0; k < widget.selectedvalues.length; k++) {
        for (int j = 0; j < subtest.docs.length; j++) {
          if (subtest.docs[j]['malzemeler'].toString().trim().contains(RegExp(
              r'' +
                  widget.selectedvalues[k].toString().toLowerCase().trim() +
                  ''))) {
            subdata.add({
              "isim": subtest.docs[j]['isim'],
              "malzemeler": subtest.docs[j]['malzemeler'],
              "resim": subtest.docs[j]['resim'],
              "tarif": subtest.docs[j]['tarif'],
              "selection": widget.selectedvalues[k].toString()
            });
          }
        }
      }
    }
    subdata = removeDuplicates(subdata, 'isim');
    print('Data Length:${subdata.length}');
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sonuçlar"),
      ),
      body: isloading == true
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: subdata.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: TextButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.grey)),
                              onPressed: () {
                                print('Index of Data:${index}');
                                setState(() {});
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => YedinciSayfaFilter(
                                      selected_recipe: index,
                                      subdata: subdata,
                                    ),
                                  ),
                                );
                              },
                              icon: Expanded(
                                child: Image.network(
                                  '${subdata[index]['resim']}',
                                  scale: 2.5,
                                ),
                              ),
                              label: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${subdata[index]['isim']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${subdata[index]['selection']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
