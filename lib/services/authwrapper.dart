import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/models/user.dart';
import 'package:firebase_test/services/facebook_auth.dart';
import 'package:firebase_test/services/google_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class authWrapper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool googleLoggedIn = true;
  final googleLogin _googleLogin = googleLogin();
  final fbLogin _fblogin = fbLogin();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, name: user.displayName) : null;
  }

  Future<void> signOut() async {
    _auth.signOut();
    if (googleLoggedIn) {
      _googleLogin.signOut();
    } else {
      _fblogin.signOut();
    }
  }

  Future<String> signInWithGoogle() async {
    googleLoggedIn = true;
    final AuthCredential credential = await _googleLogin.signIn();
    if (credential == null) {
      return null;
    } else {
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      print(user);
      final FirebaseUser currentUser = await _auth.currentUser();
      return user.toString();
    }
  }

  Future<String> signInWithFacebook() async {
    googleLoggedIn = false;
    FacebookLoginResult result = await _fblogin.signIn();

    if (result == null) {
      return null;
    } else {
      try {
        AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);
        final AuthResult authResult =
            await _auth.signInWithCredential(credential);
        final FirebaseUser user = authResult.user;
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${result.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        return profile.toString();
      } catch (e) {
        print(e.toString());
        Fluttertoast.showToast(
            msg: e.toString(),
            backgroundColor: Colors.black,
            textColor: Colors.grey,
            toastLength: Toast.LENGTH_LONG);
        return null;
      }
    }
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }
}
