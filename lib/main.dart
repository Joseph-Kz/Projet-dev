import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/Login.dart';
import 'Pages/ouverture.dart';
import 'Pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TEtudes());
}

class TEtudes extends StatelessWidget {
  const TEtudes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
    );
  }
}
