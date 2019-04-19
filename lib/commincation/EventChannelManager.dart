import 'package:flutter/services.dart';
class EventChannelManager {
  // 工厂模式
  factory EventChannelManager() =>_getInstance();
  static EventChannelManager get instance => _getInstance();
  static EventChannelManager _instance;
  EventChannelManager._internal() {
    // 初始化
  }
  static EventChannelManager _getInstance() {
    if (_instance == null) {
      _instance = new EventChannelManager._internal();
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
      EventChannel channel = new EventChannel(channelname, m);
      eventMap[channelname] = channel;
      return channel;
    }

  }

  getChannelByName(String name) => eventMap[name];

  Map<String, EventChannel> eventMap = new Map<String, EventChannel>();
}