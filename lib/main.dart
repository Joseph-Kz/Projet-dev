import 'package:flutter/material.dart';
import 'Pages/ouverture.dart';
import 'Pages/home_page.dart';
import 'Pages/Login-Signup.dart';

void main() {
  runApp(const TEtudes());
}

class TEtudes extends StatelessWidget {
  const TEtudes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
