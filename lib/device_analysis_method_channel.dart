import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_analysis_platform_interface.dart';

/// An implementation of [DeviceAnalysisPlatform] that uses method channels.
class MethodChannelDeviceAnalysis extends DeviceAnalysisPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_analysis');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
