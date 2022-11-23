
import 'device_analysis_platform_interface.dart';

class DeviceAnalysis {
  Future<String?> getPlatformVersion() {
    return DeviceAnalysisPlatform.instance.getPlatformVersion();
  }
}
