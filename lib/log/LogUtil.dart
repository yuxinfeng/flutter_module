import 'package:flutter/services.dart';


class LogUtil {

  static Future<bool> Log_v(MethodChannel channel, String logstring, [String tag]) async {
    Map map = new Map<String, String>();
    map['log'] = logstring;
    map['tag'] = tag;
    return await channel.invokeMethod('log_v', map);

  }

  static void Log_w(MethodChannel channel, String logstring, [String tag]) {
    Map map = new Map<String, String>();
    map['log'] = logstring;
    map['tag'] = tag;
    channel.invokeMethod('log_w', map);
  }
}