import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.asset('images/weizhang.png', fit: BoxFit.fitHeight),
        new Expanded(child: new Text(
            "Loading string",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,)
        ))
      ],
    );
  }
}