import 'package:flutter/material.dart';
import 'package:flutter_fire_base/model/Brew.dart';
import 'package:flutter_fire_base/view/homePage/brewFile.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<Brews>>(context);
    if (brew == null) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
      );
    } else {
      return ListView.builder(
          itemCount: brew.length,
          itemBuilder: (context, index) {
            return BrewFile(
              brew: brew[index],
            );
          });
    }
  }
}
