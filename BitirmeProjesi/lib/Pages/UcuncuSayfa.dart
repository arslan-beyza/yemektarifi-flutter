import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/DorduncuSayfa.dart';

import '../main.dart';
import 'BesinciSayfa.dart';

class UcuncuSayfa extends StatefulWidget {
  const UcuncuSayfa({Key? key}) : super(key: key);

  @override
  State<UcuncuSayfa> createState() => _UcuncuSayfaState();
}

class _UcuncuSayfaState extends State<UcuncuSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:
                          Text("Çıkış yapmak istediğinizden emin misiniz?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyApp(),
                                  ));
                            },
                            child: Text("Evet")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Hayır"))
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.exit_to_app))
        ],
        title: const Text("Hoş Geldiniz"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Material(
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Colors.blue,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DorduncuSayfa(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage('assets/asd2.jpg'),
                        height: 270,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text("Malzemeden Ara"),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.black26,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BesinciSayfa(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage('assets/asd3.jpg'),
                        height: 300,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Tariften ara",
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
