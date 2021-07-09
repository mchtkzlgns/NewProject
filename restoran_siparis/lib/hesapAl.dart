import 'package:flutter/material.dart';
import 'package:restoran_siparis/masaninHesabi.dart';

class HesapAl extends StatefulWidget {
  @override
  _HesapAlState createState() => _HesapAlState();
}

class _HesapAlState extends State<HesapAl> {
  
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
                  color: Colors.red.shade100,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MasaninHesabi(numaralar: numara.toString())),
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
