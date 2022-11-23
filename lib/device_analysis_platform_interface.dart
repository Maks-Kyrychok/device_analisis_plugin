import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_analysis_method_channel.dart';

abstract class DeviceAnalysisPlatform extends PlatformInterface {
  /// Constructs a DeviceAnalysisPlatform.
  DeviceAnalysisPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceAnalysisPlatform _instance = MethodChannelDeviceAnalysis();

  /// The default instance of [DeviceAnalysisPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceAnalysis].
  static DeviceAnalysisPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceAnalysisPlatform] when
  /// they register themselves.
  static set instance(DeviceAnalysisPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
