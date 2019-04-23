import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'MyHomePage.dart';
import 'res/RespageHome.dart';
import 'HybirdPage.dart';
import 'commincation/MethodChannelManager.dart';
import 'commincation/ChannelConst.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  String defaultName = window.defaultRouteName;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _widgetHome(defaultName),
    );
  }

  MyApp() ;


}

Widget _widgetHome (String route) {

  print(route);
  switch(route) {
    case 'yc_route':
      return MyHomePage(title: 'Flutter');
    case 'yc_res':
      return ResHomePage(title: 'Res');
    case "/":
      return HybirdPage(title: 'Hybird_Activity');
    default :
      return HybirdPage(title: route);
  }
}




