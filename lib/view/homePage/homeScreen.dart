import 'package:flutter/material.dart';
import 'package:flutter_fire_base/database/auth.dart';
import 'package:flutter_fire_base/model/Brew.dart';
import 'package:flutter_fire_base/view/homePage/SetingForm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_fire_base/database/dataBase.dart';
import 'brew_List.dart';

class Home extends StatelessWidget {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    void showPopUp() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SetingForm(),
            );
          });
    }

    return StreamProvider<List<Brews>>.value(
      value: DatabasseService().brews,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text(
              "Brews",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () => showPopUp(),
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              FlatButton.icon(
                onPressed: () async {
                  await _auth.singOut();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text(
                  '',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          body: BrewList(),
        ),
      ),
    );
  }
}
