import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restoran_siparis/MainMenu.dart';
import 'package:restoran_siparis/menuListesi.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String sifre = "";
  String doc = "";
  String _currentUserName = "";
  String currentPasword = "";
  List<String> liste = List<String>();
  //String gercekSifre="1234";
  final formkey = GlobalKey<FormState>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String dSifre = "";
  String dAdSoyad = "";

  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.green,
        ),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("v1.0"),
                  ),
                  Container(
                    height: 50,
                  ),
                  Container(
                    color: Colors.white,
                    child: Image.asset(
                      "kizilgunes.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        focusColor: Colors.black,
                        fillColor: Colors.black,
                        hoverColor: Colors.black,
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: new BorderSide(
                              color: Colors.black,
                            )),
                        hintText: '****',
                        hintStyle: TextStyle(fontSize: 18),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        prefixText: ' ',
                        suffixStyle: const TextStyle(color: Colors.black)),
                    validator: (value) {
                      for (int i = 0; i < liste.length; i++) {
                        liste.add(_currentUserName);
                       // debugPrint("sifre" + liste[i]);
                        if (value != liste[i]) {
                          return 'Yanlış Şifre';
                        
                        }
                        return null;
                      }
                    },
                    onSaved: (input) => sifre = input,
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      height: 50,
                      width: 210,
                      child: Container(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 25,
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              this.formkey.currentState.save();

                              // Process data.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainMenu()),
                              );
                            }
                            _veriOku(liste);
                          },
                          color: Colors.red.shade300,
                          textColor: Colors.black,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person),
                              Text(" Giriş Yap ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _veriOku(List liste) async {
    var users = await firestore.collection("Kullanıcılar").getDocuments();
    List<String> liste = List<String>();

    for (var doc in users.documents) {
      //debugPrint(doc.data()["Sifre"].toString());
      _currentUserName = doc.data()["Sifre"].toString();
    }
  }
}
