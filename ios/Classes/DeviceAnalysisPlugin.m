#import "DeviceAnalysisPlugin.h"
#if __has_include(<device_analysis/device_analysis-Swift.h>)
#import <device_analysis/device_analysis-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "device_analysis-Swift.h"
#endif

@implementation DeviceAnalysisPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceAnalysisPlugin registerWithRegistrar:registrar];
}
@end
