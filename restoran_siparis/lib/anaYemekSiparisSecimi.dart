import 'package:flutter/material.dart';
import 'package:restoran_siparis/SiparisKaydet.dart';
import 'package:restoran_siparis/menuListesi.dart';
import 'menuListesi.dart';

// ignore: must_be_immutable
class AanaYemekSiparisSecimi extends StatefulWidget {
  int numaralar;
  AanaYemekSiparisSecimi({this.numaralar});
  @override
  _AanaYemekSiparisSecimiState createState() => _AanaYemekSiparisSecimiState();
}

class _AanaYemekSiparisSecimiState extends State<AanaYemekSiparisSecimi> {
  List<int> adetler = List<int>();
  int masaToplami = 0;
  List<int> kasaToplamiList = List<int>();
  String kasaToplami;
  int toplam = 0;
  String siparisFisi;
  String sTarihi;
  List<String> siparisFisiList = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text(
          "Masa " + widget.numaralar.toString() + " Ana Yemekleri",
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {

              hesapla();
             
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SiparisKaydet(
                    alinanSiparisler: siparisFisiList.toString(),
                    siparisToplami: kasaToplami.toString(),
                    numaralar: widget.numaralar.toString(),
                    siparisTarihi: sTarihi.toString(),
                  ),
                ),
              );
            },
            child: Icon(Icons.check),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: MenuListesi().anaYemekler.length,
        itemBuilder: (context, index) {
          adetler.add(0);
          return Container(
            child: Card(
              color: Colors.orange.shade100,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 100,
                        height: 30,
                        child: Text(
                          "T: " +
                              (MenuListesi().anaYemekFiyatlari[index].toInt() *
                                      adetler[index])
                                  .toString(),
                          style: TextStyle(
                            color: Colors.red.shade500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.orange.shade100,
                      height: 70,
                      width: 200,
                      child: ListTile(
                        title: Text(
                          MenuListesi().anaYemekler[index].toString(),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          //
                        },
                        subtitle: Text(
                          "Adet : " + adetler[index].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      color: Colors.orange.shade100,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.green.shade100,
                        child: Text("+", style: TextStyle(fontSize: 23)),
                        onPressed: () {
                          setState(() {
                            adetler[index]++;
                          });
                        },
                      ),
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.orange.shade100,
                        height: 40,
                        child: RaisedButton(
                            child: Text("-", style: TextStyle(fontSize: 27)),
                            color: Colors.red.shade100,
                            onPressed: () {
                              setState(() {
                                if (adetler[index] > 0) {
                                  adetler[index]--;
                                }
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
    
  }
 Future hesapla()async{
                 DateTime now = DateTime.now();
              String formattedDate =
                  DateTime(now.year, now.month, now.day, now.hour, now.minute)
                      .toString();
              String sTarihi = formattedDate;
              print("tarih:$sTarihi");

              for (int i = 0; i < adetler.length; i++) {
                if (adetler[i] > 0) {
                  int fiyat =
                      (MenuListesi().anaYemekFiyatlari[i].toInt() * adetler[i]);
                  siparisFisi = (adetler[i].toString() +
                      " tane " +
                      MenuListesi().anaYemekler[i].toString() +
                      " " +
                      fiyat.toString() +
                      ".00 TL\n");
                  debugPrint(siparisFisi);
                  siparisFisiList.add(siparisFisi);
                  kasaToplamiList.add(fiyat);
                  toplam += kasaToplamiList[i].toInt();
                }
              }
              kasaToplami = toplam.toString()+".00 TL";
              print(siparisFisiList.reversed.toList());

                
              }
}
