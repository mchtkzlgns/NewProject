import 'package:flutter/material.dart';
import 'package:restoran_siparis/MainMenu.dart';
import 'package:restoran_siparis/anaYemekSiparisSecimi.dart';
import 'package:restoran_siparis/icecekSiparisSecimi.dart';
import 'package:restoran_siparis/salataSiparisSecimi.dart';
import 'package:restoran_siparis/tatliSiparisSecimi.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class SiparisKaydet extends StatefulWidget {
  String numaralar;
  String alinanSiparisler;
  String siparisToplami;
  String siparisTarihi;

  SiparisKaydet({this.numaralar, this.alinanSiparisler, this.siparisToplami,this.siparisTarihi});

  @override
  _SiparisKaydetState createState() => _SiparisKaydetState();
}

class _SiparisKaydetState extends State<SiparisKaydet> {
  Map data;

  addData() {
    Map<String, dynamic> demoData = {
      "Masa": widget.numaralar.toString(),
      "Siparis": widget.alinanSiparisler.toString(),
      "Toplam": widget.siparisToplami.toString(),
      "Sipariş Zamanı":widget.siparisTarihi.toString(),
    };
    // ignore: deprecated_member_use
    CollectionReference collectionReference =
        Firestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          title: Text("Masa " +
              widget.numaralar.toString() +
              " Sipariş Alma Menüsü".toString()),
        ),
        body: bodyMetot());
  }

  Column bodyMetot() {
    String gonderilenSiparisFisi = "Masa " +
        widget.numaralar.toString() +
        " Siparişleri \n " +
        widget.alinanSiparisler.toString() +
        "\nToplam: ${widget.siparisToplami} ".toString();
        

    return Column(
      children: <Widget>[
        Container(
          height: 5,
        ),
        Expanded(
          child: GridView.count(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: RaisedButton(
                    child: Text("Ana Yemekler", style: TextStyle(fontSize: 20)),
                    color: Colors.green.shade100,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AanaYemekSiparisSecimi(
                                  numaralar: int.parse(widget.numaralar),
                                )),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Salatalar", style: TextStyle(fontSize: 20)),
                  color: Colors.green.shade100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SalataSiparisSecimi()),
                    );
                  },
                ),
              ),
            ],
            crossAxisCount: 2,
          ),
        ),
        Expanded(
          child: GridView.count(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Tatlılar", style: TextStyle(fontSize: 20)),
                  color: Colors.green.shade100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TatliSiparisSecimi()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("İçecekler", style: TextStyle(fontSize: 20)),
                  color: Colors.green.shade100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IcecekSiparisSecimi()),
                    );
                  },
                ),
              ),
            ],
            crossAxisCount: 2,
            mainAxisSpacing: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 350,
                color: Colors.blue.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Text(gonderilenSiparisFisi.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
              RaisedButton(
                  color: Colors.red.shade100,
                  child: Text("Kasaya Gönder"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                    addData();
                  }),
            ],
          ),
        ),
      ],
    );
  }

  girisfluttertoast() {
    Fluttertoast.showToast(
        msg: "Masa " + widget.numaralar.toString() + " Siparisleri Gönderildi.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red.shade100,
        textColor: Colors.white,
        timeInSecForIosWeb: 1);
  }
}
