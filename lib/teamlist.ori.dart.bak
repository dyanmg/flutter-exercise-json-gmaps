// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_json_gmaps/teams.dart';

class TeamList extends StatelessWidget {
  final List<Teams> teams;
  TeamList({Key key, this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teams == null ? 0 : teams.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              // membuka detail dari suatu team
            },
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(
                    12.0,
                  ),
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: AssetImage('assets/logo/' + teams[index].image),
                    height: 45,
                    width: 45,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        teams[index].name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        teams[index].location,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
