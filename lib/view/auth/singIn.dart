import 'package:flutter/material.dart';
import 'package:flutter_fire_base/database/auth.dart';
import 'package:flutter_fire_base/constant/loading.dart';

class SingIn extends StatefulWidget {
  final Function togelView;

  SingIn({this.togelView});

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // texte state
  String email = "";
  String password = "";
  String erreur = "";
  @override
  Widget build(BuildContext context) {
    return loading
        ? SnipKit()
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Sing in ",
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
                        Icons.person_add,
                        size: 35,
                      ),
                      label: Text("Sing Up"),
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
                          hintText: ("email "),
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
                          hintText: ("password"),
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
                            Icons.arrow_forward,
                            size: 60,
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                                  await _auth.singInEmail(email, password);
                              if (result == null) {
                                setState(() {
                                  erreur = "email ou mots de passe non valide";
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        erreur,
                        style: TextStyle(color: Colors.red),
                      ),
                      Text('or sing in with social acconte'),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  // SingIn en anonime
  // void singInAnonime() async {
  //   dynamic resolt = await _auth.singInAnonimous();
  //   if (resolt == null) {
  //     print("problem");
  //   } else {
  //     print("sing in");
  //     print(resolt.uid);
  //   }
  // }
}
