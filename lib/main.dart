import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'MyHomePage.dart';
import 'res/RespageHome.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _widgetHome(window.defaultRouteName),
    );
  }
}

Widget _widgetHome (String route) {



  switch(route) {

    case 'yc_route':
      return MyHomePage(title: 'Flutter');
    case 'yc_res':
      return ResHomePage(title: 'Res');
    default :
      return null;
  }
}




