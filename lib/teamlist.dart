import 'package:flutter/material.dart';
import 'package:flutter_json_gmaps/teamdetails.dart';

import 'model/team.dart';

class TeamList extends StatelessWidget {
  final List<Team> teams;

  const TeamList({Key? key, required this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teams == null ? 0 : teams.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeamDetails(team: teams[index])));
            },
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12.0),
                  alignment: Alignment.topLeft,
                  child: Image(
                    image: AssetImage('assets/logo/${teams[index].image}'),
                    width: 45,
                    height: 45,
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
                        style: TextStyle(color: Colors.black.withOpacity(0.8)),
                      )
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
