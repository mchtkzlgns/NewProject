import 'package:flutter/material.dart';
import 'package:restoran_siparis/LoginPage.dart';
import 'package:restoran_siparis/SiparisAl.dart';
import 'package:restoran_siparis/hesapAl.dart';


class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.red.shade300,
        title: Text(
          "Ana Sayfa",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.orange.shade100,
                width: 400,
                height: 120,
                child: RaisedButton(
                  color: Colors.green.shade100,
                  child: Text("Siparis Al", style: TextStyle(fontSize: 23)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SiparisAl()),
                    );
                  },
                ),
              ),
            )),
          ),
          Container(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.orange.shade100,
                width: 400,
                height: 120,
                child: RaisedButton(
                  color: Colors.green.shade100,
                  child: Text("Hesap Al", style: TextStyle(fontSize: 23)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HesapAl()),
                    );
                  },
                ),
              ),
            )),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      drawer: Container(
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  child: Container(
                    child: UserAccountsDrawerHeader(
                      arrowColor: Colors.black,
                      decoration: BoxDecoration(
                        color: Colors.red.shade200,
                      ),
                      accountName: Text("Mücahit Kızılgüneş",
                          style: TextStyle(color: Colors.black)),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: Text("MK",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                      accountEmail:
                          Text("Garson", style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                Container(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Anasayfa'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      //
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.local_laundry_service),
                  title: Text('Hesabım'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Nasıl Kullanılırım ?'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('İletişim'),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    //
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
