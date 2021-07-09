import 'package:flutter/material.dart';
import 'menuListesi.dart';

class IcecekSiparisSecimi extends StatefulWidget {
  @override
  _IcecekSiparisSecimiState createState() => _IcecekSiparisSecimiState();
}

class _IcecekSiparisSecimiState extends State<IcecekSiparisSecimi> {
  List<int> adetler = List<int>();
  int masaToplami = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text(
          "İçecekler",
        ),
      ),
      body: ListView.builder(
        itemCount: MenuListesi().icecekler.length,
        itemBuilder: (context, index) {
          adetler.add(0);
          return Container(
            child: Card(
              color: Colors.orange.shade100,
              child: Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      color: Colors.orange.shade100,
                      height: 70,
                      width: 250,
                      child: ListTile(
                        title: Text(
                          MenuListesi().icecekler[index].toString(),
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
}
