import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Services/database.dart';

class Profile extends StatelessWidget {
  final String uid;

  Profile(this.uid);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      // body: Text(
           // GetUserName(uid)
      // );
    );
  }
}