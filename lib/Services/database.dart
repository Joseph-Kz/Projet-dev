// import 'package:flutter/services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import '../Models/user.dart';
//
// class Database{
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Future<String> signUpUser(UserModel user) async {
//     String retVal = "error";
//     try {
//       await _firestore.collection("users").document(user.uid).setData({
//         'email' : user.email,
//         'Fullname' : user.Fullname,
//         'Age' : user.age,
//         'Education' : user.education,
//         'Languages' : user.languages
//       });
//
//     }catch(e){
//
//     }
//     return retVal;
//   }
//
// }
// import 'package:flutter/material.dart';
//
// // Import the firebase_core and cloud_firestore plugin
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddUser extends StatelessWidget {
//   final String uid;
//   final String email;
//   final String Fullname;
//   final String age;
//   final String education;
//   final String languages;
//   final String bio;
//
//   AddUser(
//       this.uid,
//       this.email,
//       this.Fullname,
//       this.age,
//       this.education,
//       this.languages,
//       this.bio
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');
//
//     Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'email' : email,
//             'Fullname' : Fullname,
//             'Age' : age,
//             'Education' : education,
//             'Languages' : languages,
//             'Bio' : bio
//           })
//           .then((value) => print("User Added"))
//           .catchError((error) => print("Failed to add user: $error"));
//
//     }
//     return TextButton(
//       onPressed: addUser,
//       child: Text(
//         "Add User",
//       ),
//     );
//   }
//
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
