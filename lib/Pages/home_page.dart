import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../Blocs/auth_bloc.dart';
import 'package:provider/provider.dart';
import 'Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // late StreamSubscription<User> loginStateSubscription;

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
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 24, 150),
        title: const Text(
          'T`Etudes',
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              authBloc.logout();
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
          ),
          SignInButton(
            Buttons.Google,
            text: 'Sign Out of Google',
            onPressed: () => authBloc.logout(),
          )
        ] // children
            ),
      ),
    );
  }
}
