import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/AltinciSayfa.dart';
import 'AltinciSayfafilter.dart';
import 'package:login_harita/Pages/GirisEkrani.dart';

class BesinciSayfa extends StatefulWidget {
  const BesinciSayfa({Key? key}) : super(key: key);

  @override
  State<BesinciSayfa> createState() => _BesinciSayfaState();
}

class _BesinciSayfaState extends State<BesinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lütfen yemek türünü seçin"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: doc.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          print('Data Id:${doc.docs[index].id}');
                          subtest = await FirebaseFirestore.instance
                              .collection('tarif')
                              .doc(doc.docs[index].id)
                              .collection('tarifler')
                              .get();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AltinciSayfa(),
                            ),
                          );
                        },
                        child: Text("${doc.docs[index]['isim']}"),
                      ),
                    );
                  },
                ),
              ),

              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => altinciSayfa(),
              //         ),
              //       );
              //     },
              //     child: Text("Çorba"),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => altinciSayfa(),
              //         ),
              //       );
              //     },
              //     child: Text("Kahvaltı"),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => altinciSayfa(),
              //         ),
              //       );
              //     },
              //     child: Text("Tatlı"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
