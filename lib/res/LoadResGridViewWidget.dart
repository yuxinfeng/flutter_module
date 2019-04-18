import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'CommonWidget.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:transparent_image/transparent_image.dart';

class LoadGridViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewVBuilder();
  }
}

class _GridViewVBuilder extends State<LoadGridViewWidget> {

  @override
  void initState() {

  }


  getString(BuildContext context) async {
    return await (DefaultAssetBundle.of(context).loadString('assets/json/text.json'));
  }
  
  getImage(BuildContext context) async {
    return await DefaultAssetBundle.of(context).load('assets/images/weizhang.png');
  }

  void _showJsonToast(BuildContext context, String textcontext) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(textcontext, textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            )),
        action: SnackBarAction(
            label: 'json文件', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showAssetToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new Image.asset('assets/images/weizhang.png', width: 150, height: 150),
        action: SnackBarAction(
            label: 'Assets', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showNetPicToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new Image.network("https://ws1.sinaimg.cn/large/006tNc79gy1fpa5bvsqskj3044048mx5.jpg", width: 150, height: 150),
        action: SnackBarAction(
            label: '网络', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showNetPicGoodToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: new FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "https://ws1.sinaimg.cn/large/006tNc79gy1fpa5bvsqskj3044048mx5.jpg", width: 150, height: 150, fadeInDuration: const Duration(milliseconds: 1200),
          fadeOutDuration: const Duration(milliseconds: 1200),),
        action: SnackBarAction(
            label: '网络', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showPicByByteToast(BuildContext context) async {
    final scaffold = Scaffold.of(context);
    ByteData data = await getImage(context);
    final Uint8List list = data.buffer.asUint8List();
    scaffold.showSnackBar(
      SnackBar(
        content: new Image.memory(list, width: 150, height: 150),
        action: SnackBarAction(
            label: '内存中', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  List<Widget> _getChildren(BuildContext context) {
    List<Widget> indexs = List.generate(3, (index) {
      switch (index) {
        case 0 :
          ActionChip actionChip = new ActionChip(label: Text(
              "获取图片资源",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () {
          });
          return actionChip;
        case 1 :
          ActionChip actionChip = new ActionChip(label: Text(
              "获取json文件",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () async {
            // addIndex();
            // print(text);
            String text = await getString(context);
            _showJsonToast(context, text);


          });
          return actionChip;

        case 2 :
          ActionChip actionChip = new ActionChip(label: Text(
              "获取配置文件",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () {
          });
          return actionChip;
      }
    });
    return indexs;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5.0),
        crossAxisSpacing: 1.0,
        crossAxisCount: 2,
        children: [
          new ActionChip(label: Text(
              "从Asset中获取图片",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () {
            _showAssetToast(context);
          }),

          new ActionChip(label: Text(
              "从网络中加载图片",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () {
            _showNetPicToast(context);
          }),
          new ActionChip(label: Text(
              "从优化从网络中加载图片",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () {
            _showNetPicGoodToast(context);
          }),
          new ActionChip(label: Text(
              "二进制文件流中加载图片",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () {
            _showPicByByteToast(context);
          }),
          new ActionChip(label: Text(
              "获取本地JSON配置",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              )), onPressed: () async {
            String text = await getString(context);
            _showJsonToast(context, text);
          })
        ]
    );
  }
}