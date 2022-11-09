import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'form_validation.dart';
import 'github_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<GithubUser> getData() async {
    var response = await http.get(
      Uri.parse('https://api.github.com/users/monisbaig'),
    );
    return GithubUser.fromJson(
      jsonDecode(response.body),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future and Form Demo'),
      ),
      body: Column(
        children: [
          FutureBuilder<GithubUser>(
            future: getData(),
            builder: (childContent, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Image.network(snapshot.data?.avatarUrl ?? '');
                // return Text(snapshot.data?.login ?? '');
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FormValidation(),
                ),
              );
            },
            child: const Text('Form Screen'),
          ),
        ],
      ),
    );
  }
}
