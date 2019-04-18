import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'GridViewWidget.dart';
import 'LoadResGridViewWidget.dart';

class ResHomePage extends StatefulWidget {
  ResHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResHomeState createState() => _ResHomeState(title);
}

class _ResHomeState extends State<ResHomePage> {

  String title;

  _ResHomeState(this.title);
  
  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: LoadGridViewWidget(),
      );
  }
}