#ifndef FLUTTER_PLUGIN_DEVICE_ANALYSIS_PLUGIN_H_
#define FLUTTER_PLUGIN_DEVICE_ANALYSIS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace device_analysis {

class DeviceAnalysisPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DeviceAnalysisPlugin();

  virtual ~DeviceAnalysisPlugin();

  // Disallow copy and assign.
  DeviceAnalysisPlugin(const DeviceAnalysisPlugin&) = delete;
  DeviceAnalysisPlugin& operator=(const DeviceAnalysisPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace device_analysis

#endif  // FLUTTER_PLUGIN_DEVICE_ANALYSIS_PLUGIN_H_
