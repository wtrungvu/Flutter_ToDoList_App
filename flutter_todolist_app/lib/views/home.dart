import 'package:flutter/material.dart';

import 'body.dart';
import 'header.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Header(),
              Expanded(child: Body()),
            ],
          )),
    );
  }
}
