import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_tetudes/Pages/home_page.dart';
import 'package:projet_tetudes/Widget/widget.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../utils/hex_color.dart';
import 'Signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

GlobalMethods _globalMethods = GlobalMethods();

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("000000"),
          hexStringToColor("4B39EF")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 150),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/Logoo.png"),
                const SizedBox(
                  height: 0,
                ),
                reusableTextField("Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }).onError((error, stackTrace) {
                    String Error_message = "Error ${error.toString()}";
                    _globalMethods.showErrorDialog(Error_message, context);
                  });
                }),
                signUpOption(),
                const SizedBox(
                  height: 20,
                ),
                Googlebutton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Row Googlebutton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SignInButton(
        Buttons.Google,
        onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Googlebutton())),
      )
    ]);
  }
}
