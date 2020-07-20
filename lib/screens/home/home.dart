import 'package:firebase_test/screens/loginPage.dart';
import 'package:firebase_test/services/authwrapper.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final authWrapper _auth = authWrapper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginPage()));
              },
              icon: Icon(Icons.person),
              label: Text("Sign Out"))
        ],
      ),
    );
  }
}
