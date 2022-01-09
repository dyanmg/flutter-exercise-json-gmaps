import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/team.dart';
import 'teamlist.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premiere League Team',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Premiere League Teams';
  late List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            // deteksi ada tidak atau tidak
            if (snapshot.connectionState == ConnectionState.done) {
              List<Team> teams = parseJSON(snapshot.data.toString());
              // if (teams == null) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }

              TeamList teamList = TeamList(teams: teams);

              return teamList;
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString('assets/data/teams.json'),
        ),
      ),
    );
  }

  List<Team> parseJSON(String? response) {
    if (response == null) {
      return [];
    }

    final parsedData = json.decode(response).cast<Map<String, dynamic>>();

    return parsedData.map<Team>((json) => Team.fromJson(json)).toList();
  }
}
