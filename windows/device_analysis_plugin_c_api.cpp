#include "include/device_analysis/device_analysis_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "device_analysis_plugin.h"

void DeviceAnalysisPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  device_analysis::DeviceAnalysisPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
