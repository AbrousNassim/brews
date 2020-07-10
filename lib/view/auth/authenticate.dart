import 'package:flutter/material.dart';
import 'singIn.dart';
import 'singUp.dart';

class Authnticate extends StatefulWidget {
  @override
  _AuthnticateState createState() => _AuthnticateState();
}

class _AuthnticateState extends State<Authnticate> {
  bool showSingIn = true;
  void togelView() {
    setState(() => showSingIn = !showSingIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSingIn) {
      return SingIn(togelView: togelView);
    } else {
      return SingUp(togelView: togelView);
    }
  }
}
