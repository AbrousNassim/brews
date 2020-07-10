import 'package:flutter/material.dart';
import 'package:flutter_fire_base/constant/loading.dart';
import 'package:flutter_fire_base/database/auth.dart';

class SingUp extends StatefulWidget {
  final Function togelView;

  SingUp({this.togelView});

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  // texte state
  String email = "";
  String password = "";
  String ereur = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? SnipKit()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Sing Up ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 1.5,
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.person_outline,
                        size: 35,
                      ),
                      label: Text("Sing In"),
                      onPressed: () {
                        widget.togelView();
                      },
                    ),
                  )
                ],
                backgroundColor: Colors.grey[700],
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: new InputDecoration.collapsed(
                          hintText: ("Email "),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter a valid email address' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration.collapsed(
                          hintText: ("Password"),
                        ),
                        validator: (val) => val.length < 6
                            ? 'Password must contain at least 6 characters '
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      Container(
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          icon: Icon(
                            Icons.add_box,
                            size: 60,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic resolt =
                                  await _auth.singUpEmail(email, password);
                              if (resolt == null) {
                                setState(() {
                                  ereur = "email or password invalid";
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        ereur,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
