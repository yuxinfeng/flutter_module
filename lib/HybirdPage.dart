import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'commincation/MethodChannelManager.dart';
import 'log/LogUtil.dart';
import 'commincation/ChannelConst.dart';

class HybirdPage extends StatefulWidget {
  HybirdPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HybirdPageState createState() => _HybirdPageState();
}

class _HybirdPageState extends State<HybirdPage> {

  MethodChannel _methodChannel = MethodChannelManager.instance.create(ChannelConst.HYBIRDCHANNEL, StandardMethodCodec());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new ActionChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('Log'),
                ),
                label: Text('调用Native日志模块'), onPressed: () async {
                bool a = await LogUtil.Log_v(_methodChannel, "log日志");
                print("=========" + a.toString());

            }),
            new ActionChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('库'),
                ),
                label: Text('调用数据库'), onPressed: () {

            }),
            new ActionChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('网络'),
                ),
                label: Text('调用网络'), onPressed: () {
            })

          ],
        ),
      ),
    );
  }

  @override
  void initState() {

  }
}