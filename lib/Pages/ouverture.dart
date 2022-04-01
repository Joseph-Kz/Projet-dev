import 'package:flutter/material.dart';
import 'package:projet_tetudes/main.dart';

class Ouverture extends StatefulWidget {
  const Ouverture({Key? key}) : super(key: key);

  @override
  _OuvertureState createState() => _OuvertureState();
}

class _OuvertureState extends State<Ouverture> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'T`Etudes, For Strangers by Strangers',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TEtudes extends StatelessWidget {
  const TEtudes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
