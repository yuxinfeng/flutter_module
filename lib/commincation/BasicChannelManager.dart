import 'package:flutter/services.dart';
class BasicChannelManager {
  // 工厂模式
  factory BasicChannelManager() =>_getInstance();
  static BasicChannelManager get instance => _getInstance();
  static BasicChannelManager _instance;
  BasicChannelManager._internal() {
    // 初始化
  }
  static BasicChannelManager _getInstance() {
    if (_instance == null) {
      _instance = new BasicChannelManager._internal();
    }
    return _instance;
  }

  create(String channelname, MessageCodec m) {
    if (channelname == null) {
      throw Exception("Basic channel 参数错误");
    }
    if (m == null) {
      m = StandardMessageCodec();
    }
    if (eventMap.containsKey(channelname)) {
      return eventMap[channelname];
    } else {
      BasicMessageChannel channel = new BasicMessageChannel(channelname, m);
      eventMap[channelname] = channel;
      return channel;
    }

  }

  getChannelByName(String name) => eventMap[name];

  Map<String, BasicMessageChannel> eventMap = new Map<String, BasicMessageChannel>();
}