import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:projet_tetudes/Pages/ouverture.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("T`Etude's"),
          backgroundColor: const Color.fromARGB(255, 37, 24, 150),
          actions: [
            IconButton(
                onPressed: () => googleSignOut(),
                icon: const Icon(Icons.logout)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.person)),
          ]),
    );
  }

  googleSignOut() {}
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.person_search,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {});
                } else {
                  setState(() {});
                }
              },
              decoration: const InputDecoration.collapsed(
                hintText: 'Search here...',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          StreamBuilder(builder: (context, snapshot) {
            return snapshot.data == true
                ? GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.clear_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                : const SizedBox.shrink();
          })
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
      ),
    );
    throw UnimplementedError();
  }
}
