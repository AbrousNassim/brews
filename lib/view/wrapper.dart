import 'package:flutter/material.dart';
import 'package:flutter_fire_base/model/user.dart';
import 'package:flutter_fire_base/view/homePage/homeScreen.dart';
import 'package:provider/provider.dart';
import 'auth/authenticate.dart';
import 'package:flutter_fire_base/constant/loading.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    try {
      // return soi home soi login sing in ..
      if (user == null) {
        return Authnticate();
      } else {
        return Home();
      }
    } catch (e) {
      return SnipKit();
    }
  }
}
