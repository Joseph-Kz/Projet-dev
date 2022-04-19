import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet_tetudes/Pages/home_page.dart';
import 'package:projet_tetudes/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widget/widget.dart';
import '../utils/hex_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
GlobalMethods _globalMethods = GlobalMethods();

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _FullNameTextController = TextEditingController();
  TextEditingController _AgeTextController = TextEditingController();
  TextEditingController _EducationTextController = TextEditingController();
  TextEditingController _LanguagesTextController = TextEditingController();
  TextEditingController _bioTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    late String Fullname; late String age; late String education; late String languages; late String bio;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("000000"),
                hexStringToColor("4B39EF")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter )),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 330),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Email", Icons.email_outlined, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Fullname", Icons.person_outline, false,
                        _FullNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Age", Icons.person_outline, false,
                        _AgeTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Education", Icons.school_outlined, false,
                        _EducationTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Languages", Icons.language, false,
                        _LanguagesTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Bio", Icons.language, false,
                    _bioTextController),
                    const SizedBox(
                    height: 20,
                    ),
                    firebaseUIButton(context, "Sign Up", () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) async {
                        UserSetup(_FullNameTextController.text, _AgeTextController.text, _EducationTextController.text, _LanguagesTextController.text, _bioTextController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        if (user!= null && !user.emailVerified) {
                          await user.sendEmailVerification();
                        }
                          // await user?.sendEmailVerification();
                      }).onError((error, stackTrace) {
                        String Error_message = "Error ${error.toString()}";
                        _globalMethods.showErrorDialog(Error_message, context);
                      });
                    }),
                  ],
                ),
              )
          )
      ),
    );
  }
}