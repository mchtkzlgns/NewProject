import 'package:flutter/material.dart';
import 'package:restoran_siparis/SiparisKaydet.dart';

class SiparisAl extends StatefulWidget {
  @override
  _SiparisAlState createState() => _SiparisAlState();
}

class _SiparisAlState extends State<SiparisAl> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: new GridView.count(
        crossAxisCount: 4,
        children: new List.generate(16, (numara) {
          return new GridTile(
            child: Container(
              child: new Card(
                  child: new Container(
                child: RaisedButton(
                  color: Colors.green.shade100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SiparisKaydet(
                                numaralar: numara.toString(),
                              )),
                    );
                  },
                  child: new Text(
                    'Masa $numara',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              )),
            ),
          );
        }),
      ),
    );
  }
}
