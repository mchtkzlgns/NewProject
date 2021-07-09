import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';

// ignore: must_be_immutable
class MasaninHesabi extends StatefulWidget {
  String numaralar;
  String alinanSiparisler;
  String siparisToplami;
  Map data;
  String tarih;

  MasaninHesabi({this.numaralar, this.alinanSiparisler, this.siparisToplami,this.tarih});

  @override
  _MasaninHesabiState createState() => _MasaninHesabiState();
}

class _MasaninHesabiState extends State<MasaninHesabi> {
  @override
// ignore: override_on_non_overriding_member
// ignore: deprecated_member_use
  // final _firestore = Firestore.instance;

  // ignore: missing_return
  Widget build(BuildContext context) {
    //CollectionReference users = FirebaseFirestore.instance.collection('data');

    return Scaffold(
      appBar: AppBar(
        title: Text("Masa " + widget.numaralar + " Hesabı"),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('data')
            .where("Masa", isEqualTo: widget.numaralar)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LinearProgressIndicator());
          } else {
            return new ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              return Card(
                  child: ListTile(
                title: Text("Masa Numarası " +
                    documentSnapshot.data()['Masa'] +
                    "\n" +
                    "MasaToplami " +
                    documentSnapshot.data()['Toplam']+
                    "\n"+"Sipariş Zamanı "+documentSnapshot.data()["Sipariş Zamanı"]),
                subtitle: Text(documentSnapshot.data()['Siparis']),
              ));
            }).toList());
          }
        },
      ),
    );
  }
}
