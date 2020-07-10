import 'package:flutter/material.dart';
import 'package:flutter_fire_base/database/dataBase.dart';
import 'package:flutter_fire_base/model/user.dart';
import 'package:flutter_fire_base/model/userDataModel.dart';
import 'package:provider/provider.dart';

class SetingForm extends StatefulWidget {
  @override
  _SetingFormState createState() => _SetingFormState();
}

class _SetingFormState extends State<SetingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _curentName;
  String _curentSugar;
  int _curentstrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabasseService(uid: user.uid).getUserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Update Your brew setings",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    initialValue: _curentName ?? userData.name,
                    validator: (val) =>
                        val.isEmpty ? 'Eter a name please' : null,
                    onChanged: (val) => setState(() => _curentName = val),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                      value: _curentSugar ?? userData.sugar,
                      items: sugars.map((sugars) {
                        return DropdownMenuItem(
                          value: sugars,
                          child: Text("$sugars sugars"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() => _curentSugar = val);
                      }),
                  SizedBox(height: 20),
                  Slider(
                    value: _curentstrength == null || userData.strength == null
                        ? 100.0
                        : (_curentstrength ?? userData.strength).toDouble(),
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    activeColor:
                        Colors.brown[_curentstrength ?? userData.strength],
                    inactiveColor:
                        Colors.brown[_curentstrength ?? userData.strength],
                    onChanged: (val) =>
                        setState(() => _curentstrength = val.round()),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () async {
                      await DatabasseService(uid: user.uid).updateUserData(
                        _curentSugar ?? userData.sugar,
                        _curentName ?? userData.name,
                        _curentstrength ?? userData.strength,
                      );
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {}
          return Container();
        });
  }
}
