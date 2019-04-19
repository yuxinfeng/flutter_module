import 'package:flutter/services.dart';
class MethodChannelManager {
  // 工厂模式
  factory MethodChannelManager() =>_getInstance();
  static MethodChannelManager get instance => _getInstance();
  static MethodChannelManager _instance;
  MethodChannelManager._internal() {
    // 初始化
  }
  static MethodChannelManager _getInstance() {
    if (_instance == null) {
      _instance = new MethodChannelManager._internal();
    }
    return _instance;
  }

  create(String channelname, MethodCodec m) {
    if (channelname == null) {
      throw Exception("Event channel 参数错误");
    }
    if (m == null) {
      m = StandardMethodCodec();
    }
    if (eventMap.containsKey(channelname)) {
      return eventMap[channelname];
    } else {
      MethodChannel channel = new MethodChannel(channelname, m);
      eventMap[channelname] = channel;
      return channel;
    }

  }

  getChannelByName(String name) => eventMap[name];

  Map<String, MethodChannel> eventMap = new Map<String, MethodChannel>();
}