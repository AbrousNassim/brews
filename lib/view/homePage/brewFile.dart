import 'package:flutter/material.dart';
import 'package:flutter_fire_base/model/Brew.dart';

class BrewFile extends StatelessWidget {
  final Brews brew;
  BrewFile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(
            brew.name,
            style: TextStyle(fontSize: 15),
          ),
          subtitle: Text(
            "Tacks ${brew.sugar} sugar(s)",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
