import 'dart:async';

import 'package:flutter/services.dart';

class ScreenSizeAnalisis {
  static const MethodChannel _channel =
      MethodChannel('maks.kyrychok/screensize');

  static Future<String> getScreenSize() async {
    try {
      final String result = await _channel.invokeMethod('getScreenSize');
      return result;
    } catch (e) {
      return '$e';
    }
  }
}
