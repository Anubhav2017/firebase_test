import 'package:firebase_test/models/user.dart';
import 'package:firebase_test/screens/loginPage.dart';
import 'package:firebase_test/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return loginPage();
    } else {
      return Home();
    }
  }
}
