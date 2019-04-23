import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';

class LoadNativPlugin {

  static const MethodChannel _channel = const MethodChannel('com.hybrid.res/plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //声明plugin加载的方法，参数为url，callback回调
  Future<dynamic> getNativeImage(
      String imageName,
      Function callback) async {
    final result = await _channel.invokeMethod('getNativeDrawable', imageName);
    if (callback != null) {
      callback(result);
    }
  }
}



