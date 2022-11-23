#include "device_analysis_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <iostream>
#include <string>
namespace device_analysis

{

  // static
  void DeviceAnalysisPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarWindows *registrar)
  {
    auto channel =
        std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
            registrar->messenger(), "maks.kyrychok/screensize",
            &flutter::StandardMethodCodec::GetInstance());

    auto plugin = std::make_unique<DeviceAnalysisPlugin>();

    channel->SetMethodCallHandler(
        [plugin_pointer = plugin.get()](const auto &call, auto result)
        {
          plugin_pointer->HandleMethodCall(call, std::move(result));
        });

    registrar->AddPlugin(std::move(plugin));
  }

  DeviceAnalysisPlugin::DeviceAnalysisPlugin() {}

  DeviceAnalysisPlugin::~DeviceAnalysisPlugin() {}

  void DeviceAnalysisPlugin::HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result)
  {
    if (method_call.method_name().compare("getScreenSize") == 0)
    {
      ::SetThreadDpiAwarenessContext(DPI_AWARENESS_CONTEXT_SYSTEM_AWARE);

      const auto nScreenWidth = GetSystemMetrics(SM_CXSCREEN);
      const auto nScreenHeight = GetSystemMetrics(SM_CYSCREEN);

      const auto stringWidth = std::to_string(nScreenWidth);
      const auto stringHeight = std::to_string(nScreenHeight);

      result->Success(flutter::EncodableValue(stringWidth + "x" + stringHeight));
    }
    else
    {
      result->NotImplemented();
    }
  }

} // namespace device_analysis
