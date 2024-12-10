import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'GirisEkrani.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController controlKullanici;
  late TextEditingController controlSifre;
  late TextEditingController controlSifreTekrar;
  late TextEditingController controlMail;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controlKullanici.dispose();
    controlMail.dispose();
    controlSifre.dispose();
    controlSifreTekrar.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlKullanici = TextEditingController();
    controlMail = TextEditingController();
    controlSifre = TextEditingController();
    controlSifreTekrar = TextEditingController();
  }

  GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Yeni Kayıt"),
      ),
      body: Center(
        child: Form(
          key: formRegisterKey,
          child: ListView(
            children: <Widget>[
              Padding(
                // Kullanıcı adı kayıt girişi
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: controlKullanici,
                  validator: (value) {
                    if (value!.length < 3) {
                      return "Lütfen en az 3 karakter giriniz";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kullanıcı Adınızı Girin',
                  ),
                ),
              ),
              Padding(
                // mail kayıt girişi
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: controlMail,
                  validator: (value) {
                    if (!validateEmail(value.toString())) {
                      return "Lütfen mail adresi giriniz.";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Mail Adresinizi Girin',
                  ),
                ),
              ),
              Padding(
                // Şifre girişi
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  obscureText: true,
                  controller: controlSifre,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "lütfen en az 6 karakter giriniz";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifrenizi Girin',
                  ),
                ),
              ),
              Padding(
                // Şifre tekrar girişi

                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  obscureText: true,
                  controller: controlSifreTekrar,
                  validator: (value) {
                    if (controlSifre.text != value) {
                      return "Lütfen aynı şifreyi giriniz";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Şifrenizi doğrulayın',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO kullanıcı adı ve şifre onayı al
                  if (formRegisterKey.currentState!.validate()) {
                    kayitOl(controlMail.text.toLowerCase().trim(),
                            controlSifre.text, controlKullanici.text)
                        .then((value) {
                      //kayit başarılı ise
                      if (value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Kayıt Başarılı!"),
                          backgroundColor: Colors.green,
                        ));

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const GirisEkrani(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Hata!"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    });
                  }
                },
                child: const Text(style: TextStyle(fontSize: 20), 'Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//asenkron işlemelrde internet isteği yapıp başarılı mı değil mi anlaması için
//kullanılan bir asenkron fonksiyon
Future<bool> kayitOl(String email, String password, String kullanici) async {
  try {
    final UserCredential userCredential;
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (value.user != null) {
        value.user!.updateDisplayName(kullanici);
      }
      print(value.user);
      return value;
    });
    return true;
  } on FirebaseAuthException catch (error) {
    print(error);
    if (error.code == 'email-already-in-use') {
      print("Lütfen farklı bir email giriniz");
    }
    return false;
  }
}

//şifre unuttum
// ana keranda daha önce giriş yapıp yapmadığı
// şifre değiştirme özelliği
// email yenileme.
//
