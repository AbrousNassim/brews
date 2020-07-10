import 'package:flutter/material.dart';
import 'package:flutter_fire_base/database/auth.dart';
import 'package:flutter_fire_base/view/wrapper.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().user,
      child: MaterialApp(
        title: 'home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
