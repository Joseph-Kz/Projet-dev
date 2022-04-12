import 'package:flutter/material.dart';
import 'package:projet_tetudes/Pages/home_page.dart';

const owlUrl =
    'https://www.univ-grenoble-alpes.fr/medias/photo/uga-soutien-etudiants_1611570121559-jpg';

class Ouverture extends StatefulWidget {
  const Ouverture({Key? key}) : super(key: key);

  @override
  _OuvertureState createState() => _OuvertureState();
}

class _OuvertureState extends State<Ouverture> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.network(owlUrl),
      TextButton(
        child: const Text('T`Etudes, For Strangers by Strangers',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.15,
            )),
        onPressed: (() => {HomePage}),
      )
    ]);
  }
}

class Open extends StatelessWidget {
  const Open({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 37, 24, 150),
        body: Center(
          child: Ouverture(),
        ),
      ),
    );
  }
}
