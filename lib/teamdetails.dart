import 'package:flutter/material.dart';

import 'model/team.dart';
import 'teammap.dart';

class TeamDetails extends StatefulWidget {
  final Team team;

  TeamDetails({Key? key, required this.team}) : super(key: key);

  @override
  _TeamDetailsState createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(12.0),
              width: 450.0,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: Image(
                      image: AssetImage('assets/logo/${widget.team.image}'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'City',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          widget.team.location,
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Stadium',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          widget.team.stadium,
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Capacity',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          widget.team.capacity.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Captain',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          widget.team.captain,
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TeamMap(team: widget.team))),
                      child: Text('Open Maps'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
