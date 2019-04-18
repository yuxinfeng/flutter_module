import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    initMessageHandle();
    initEventHandle();
    initMethodHandle();
  }

  static const androidAndflutter = const BasicMessageChannel(
      'com.ycbjie.androidAndFlutter/plugin', StandardMessageCodec());
  static const methodChannel = const MethodChannel(
      'com.ycbjie.method/plugin', StandardMethodCodec());
  static const eventChannel = const EventChannel(
      'com.ycbjie.event/plugin', StandardMethodCodec());

  Future<String> sendMessage() async {
    String replay = await androidAndflutter.send(
        'Hello world native, i am flutter side');
    return replay;
  }

  static void initMessageHandle() {
    print("init message handler");
    androidAndflutter.setMessageHandler((message) async {
      print("from native" + message);
      return "Hello, native, i am flutter side 接到消息";
    });
  }

  static void initMethodHandle() {
    print('init method handle');
    methodChannel.setMethodCallHandler((methodCall) {
      print(methodCall.toString());
      String methodname = methodCall.method;
      var arg = methodCall.arguments;
      switch (methodname) {
        case "flutter_method1":
          print(methodname);
          break;
        case "flutter_method2" :
          print(methodname);
      }
    });
  }

  static Future<dynamic> invokeNative(String methodName,
      [dynamic arguments]) async {
    return await methodChannel.invokeMethod(methodName, arguments);
  }

  void initEventHandle() {
    print('init event handle');
    eventChannel.receiveBroadcastStream().listen(
        _onFromAndroidEvent, onError: _onFromAndroidError);
  }

  void _onFromAndroidEvent(Object event) {
    print(event.toString());
  }

  //接收失败
  void _onFromAndroidError(Object error) {
    print(error.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionChip(label: Text('调用native basic channel'), onPressed: () {
              sendMessage();
            }),
            ActionChip(label: Text('调用native method channel'), onPressed: () {
              invokeNative("method1");
            }),
            ActionChip(label: Text('调用native method2 channel'), onPressed: () {
              invokeNative("method2", true);
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}