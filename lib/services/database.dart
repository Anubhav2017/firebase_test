import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference collection = Firestore.instance.collection('users');

  Future updateUserData(User profile) async {
    return await collection.document(uid).setData({'profile': profile});
  }
}
