import 'package:flutter/cupertino.dart';
<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:projet_tetudes/Pages/home_page.dart';
import 'Login.dart';

import 'package:projet_tetudes/Pages/ouverture.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),
          backgroundColor: const Color.fromARGB(255, 37, 24, 150),
          actions: []),
    );
  }

  googleSignOut() {}
}
>>>>>>> b820c06af73cc4f9d35580b4135a9df88adb989c
