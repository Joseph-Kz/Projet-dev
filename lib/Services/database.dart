import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<void> UserSetup(String Fullname, String age, String education, String languages, String bio) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;
  var uid = auth.currentUser?.uid.toString();
  users.add({
    'Fullname' : Fullname,
    'age' : age,
    'education' : education,
    'languages' : languages,
    'bio' : bio,
    'uid' : uid
  });
  return;
}
// class DatabaseService {
//
//
//
//   // collection reference
//   final CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//   Future<void> updateUserData(String Fullname, String age, String education, String languages, String bio) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//   var uid = auth.currentUser?.uid.toString();
//     return await users.document(uid).setData({
//       'Fullname' : Fullname,
//       'age' : age,
//       'education' : education,
//       'languages' : languages,
//       'bio' : bio
//     });
//   }
//
// }