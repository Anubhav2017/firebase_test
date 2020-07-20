import 'package:firebase_test/models/user.dart';
import 'package:firebase_test/services/authwrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_test/screens/loginPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: authWrapper().user,
      child: MaterialApp(
        home: loginPage(),
      ),
    );
  }
}
