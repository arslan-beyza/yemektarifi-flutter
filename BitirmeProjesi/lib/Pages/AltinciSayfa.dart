// ignore_for_file: prefer_const_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/GirisEkrani.dart';
import 'YedinciSayfa.dart';

var selected_recipe = 0;

class AltinciSayfa extends StatefulWidget {
  const AltinciSayfa({Key? key}) : super(key: key);

  @override
  State<AltinciSayfa> createState() => _AltinciSayfaState();
}

class _AltinciSayfaState extends State<AltinciSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sonuçlar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.lightBlue.shade200)),
                        onPressed: () {
                          selected_recipe = index;
                          setState(() {});
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => YedinciSayfa(),
                            ),
                          );
                        },
                        icon: Expanded(
                          child: Image.network(
                            '${subtest.docs[index]["resim"]}',
                            scale: 0.5,
                          ),
                        ),
                        label: Text(
                          '${subtest.docs[index]["isim"]}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
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
