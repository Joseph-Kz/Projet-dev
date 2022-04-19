import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:projet_tetudes/Pages/profile.dart';
import '../Blocs/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'Login.dart';
import 'package:projet_tetudes/Pages/ouverture.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // late StreamSubscription<User> loginStateSubscription;
  final ScrollController scrollController = ScrollController();

  int _selectedIndex = 0;
  late String currentUserId;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   loginStateSubscription.cancel();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("T`Etude's"),
          backgroundColor: const Color.fromARGB(255, 37, 24, 150),
          actions: [
            IconButton(
                onPressed: () {
                  authBloc.logout();
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                },
                icon: const Icon(Icons.logout)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                icon: const Icon(Icons.person)),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendrier',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
