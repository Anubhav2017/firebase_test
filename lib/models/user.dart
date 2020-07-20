import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String name;

  User({this.uid, this.name});

  User userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, name: user.displayName) : null;
  }
}
