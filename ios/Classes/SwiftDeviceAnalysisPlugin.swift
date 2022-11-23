import Flutter
import UIKit

public class SwiftDeviceAnalysisPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_analysis", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceAnalysisPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(CGRect = UIScreen.main.bounds)
  }
}
