// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

import 'model/team.dart';

import 'dart:html';
import 'dart:ui' as ui;

class TeamMap extends StatefulWidget {
  final Team team;

  TeamMap({Key? key, required this.team}) : super(key: key);

  @override
  _TeamMapState createState() => _TeamMapState();
}

class _TeamMapState extends State<TeamMap> {
  // late GoogleMapController mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.team.name),
  //     ),
  //     body: GoogleMap(
  //       onMapCreated: _onMapCreated,
  //       initialCameraPosition: CameraPosition(
  //           target: LatLng(widget.team.lat, widget.team.lng), zoom: 10.0),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.team.name),
      ),
      body: Container(
        child: getMap(),
      ),
    );
  }

  Widget getMap() {
    String htmlId = "7";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = LatLng(widget.team.lat, widget.team.lng);

      final mapOptions = MapOptions()
        ..zoom = 8
        ..center = LatLng(widget.team.lat, widget.team.lng);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
