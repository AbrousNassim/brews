import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SnipKit extends StatelessWidget {
  const SnipKit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.blueGrey,
          size: 50,
        ),
      ),
    );
  }
}
