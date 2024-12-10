import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_harita/Pages/AltinciSayfafilter.dart';
import 'package:login_harita/Pages/BesinciSayfa.dart';
import 'package:login_harita/Pages/GirisEkrani.dart';
import 'YedinciSayfa.dart';

class DorduncuSayfa extends StatefulWidget {
  const DorduncuSayfa({Key? key}) : super(key: key);

  @override
  State<DorduncuSayfa> createState() => _DorduncuSayfaState();
}

class _DorduncuSayfaState extends State<DorduncuSayfa> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked7 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  var selectedvalues = [];
  bool loading = false;
  String selectedstringvalue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lütfen malzeme Seçin"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                              if (isChecked == true) {
                                selectedvalues.add('Patlıcan');
                              } else {
                                selectedvalues.remove('Patlıcan');
                              }
                            });
                          },
                        ),
                        Text('Patlıcan'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value!;
                              if (isChecked1 == true) {
                                selectedvalues.add('Kıyma');
                              } else {
                                selectedvalues.remove('Kıyma');
                              }
                            });
                          },
                        ),
                        Text('Kıyma'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value!;
                              if (isChecked2 == true) {
                                selectedvalues.add('Soğan');
                              } else {
                                selectedvalues.remove('Soğan');
                              }
                            });
                          },
                        ),
                        Text('Soğan'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked3,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked3 = value!;
                              if (isChecked3 == true) {
                                selectedvalues.add('Domates');
                              } else {
                                selectedvalues.remove('Domates');
                              }
                            });
                          },
                        ),
                        Text('Domates'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked4,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked4 = value!;
                              if (isChecked4 == true) {
                                selectedvalues.add('Biber');
                              } else {
                                selectedvalues.remove('Biber');
                              }
                            });
                          },
                        ),
                        Text('Biber'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked5,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked5 = value!;
                              if (isChecked5 == true) {
                                selectedvalues.add('Maya');
                              } else {
                                selectedvalues.remove('Maya');
                              }
                            });
                          },
                        ),
                        Text('Maya'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked6,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked6 = value!;
                              if (isChecked6 == true) {
                                selectedvalues.add('Yumurta');
                              } else {
                                selectedvalues.remove('Yumurta');
                              }
                            });
                          },
                        ),
                        Text('Yumurta'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked7,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked7 = value!;
                              if (isChecked7 == true) {
                                selectedvalues.add('Pirinç ');
                              } else {
                                selectedvalues.remove('Pirinç ');
                              }
                            });
                          },
                        ),
                        Text('Pirinç '),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked8,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked8 = value!;
                              if (isChecked8 == true) {
                                selectedvalues.add('Bulgur');
                              } else {
                                selectedvalues.remove('Bulgur');
                              }
                            });
                          },
                        ),
                        Text('Bulgur '),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked9,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked9 = value!;
                              if (isChecked9 == true) {
                                selectedvalues.add('Krema');
                              } else {
                                selectedvalues.remove('Krema');
                              }
                            });
                          },
                        ),
                        Text('Krema'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: isChecked10,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked10 = value!;
                              if (isChecked10 == true) {
                                selectedvalues.add('Çikolata');
                              } else {
                                selectedvalues.remove('Çikolata');
                              }
                            });
                          },
                        ),
                        Text('Çikolata'),
                      ],
                    ),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            selectedstringvalue == ""
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${selectedstringvalue}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
            SizedBox(
              height: 10,
            ),
            loading == true
                ? Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      for (int i = 0; i < selectedvalues.length; i++) {
                        setState(() {
                          selectedstringvalue += "${selectedvalues[i]}" + ",";
                        });
                      }
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AltinciSayfafilter(
                            selectedvalues: selectedvalues,
                          ),
                        ),
                      );
                    },
                    child: const Text("Malzemeden ara"),
                  ),
          ],
        ),
      ),
    );
  }
}
