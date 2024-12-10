// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_typing_uninitialized_variables
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/sifremi_unutum_page.dart';
import 'package:login_harita/main.dart';
import 'IkinciSayfa.dart';
import 'UcuncuSayfa.dart';

var doc;
var subtest;

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({Key? key}) : super(key: key);

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  //text kutucukların yazılarını almak için kontrol değişkeni
  late TextEditingController controlMail;
  late TextEditingController controlSifre;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controlMail.dispose();
    controlSifre.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    controlMail = TextEditingController();
    controlSifre = TextEditingController();
  }

  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      //form register key bununla anahtar doğrulama yaparız
      key: formLoginKey,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/logo/logo.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 150),
              Padding(
                // Kullanıcı adı girişi
                padding: EdgeInsets.all(30.0),
                child: TextFormField(
                  validator: (value) {
                    //validate email ile tanımla eğer email doğru ise hata vermesin
                    if (!validateEmail(value.toString())) {
                      return "Lütfen E-Postanızı giriniz";
                    }
                  },
                  controller: controlMail,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'E-Posta',
                    hintText: 'E-Postanızı Girin',
                  ),
                ),
              ),
              Padding(
                // Parola Girişi
                padding: EdgeInsets.all(30.0),
                child: TextFormField(
                  //şartlandırma eğer 6 karakteri geçmezse hata
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Lütfen en az 6 karakterli giriniz";
                    }
                  },
                  controller: controlSifre,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: 'Parola',
                    hintText: 'Parolanızı girin',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Container(
                color: Colors.white70,
                child: TextButton(
                  onPressed: () {
                    // TODO kullanıcı adı ve şifre onayı al

                    //bütün validator'ları doğrula true ise işleme geç
                    if (formLoginKey.currentState!.validate()) {
                      girisYap(controlMail.text.toLowerCase().trim(),
                              controlSifre.text)
                          .then((value) {
                        if (value) {
                          //giriş başarılı snackbar göstermesi
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Giriş Başarılı!"),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const UcuncuSayfa(),
                            ),
                          );
                        } else {
                          //giriş başarısız
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Kulanıcı adı veya şifre yanlıştır!"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                    }
                  },
                  child: const Text(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      'Giriş'),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                color: Colors.white70,
                child: TextButton(
                  onPressed: () {
                    // TODO kullanıcı adı ve şifre onayı al

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ),
                    );
                  },
                  child: const Text(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      'Kayıt Ol'),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                color: Colors.white70,
                child: TextButton(
                  onPressed: () {
                    // TODO şifremi unuttum

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SifreUnuttum(),
                      ),
                    );
                  },
                  child: const Text(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      'Şifremi unuttum'),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Future<void> getData() async {
  doc = await FirebaseFirestore.instance.collection('tarif').get();
}

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return (!regex.hasMatch(value)) ? false : true;
}

Future<bool> girisYap(String email, String sifre) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: sifre);
    return true;
  } on FirebaseAuthException catch (error) {
    log(error.code);
    if (error.code == 'user-not-found') {
      print("BÖyle bir kullanıcı bulunmamaktadır.");
    }

    return false;
  }
}
