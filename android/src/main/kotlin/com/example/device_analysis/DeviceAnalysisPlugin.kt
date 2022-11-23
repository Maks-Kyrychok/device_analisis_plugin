package com.example.device_analysis

import androidx.annotation.NonNull

import android.os.Bundle



import android.view.WindowManager;

import android.util.DisplayMetrics;
import android.content.res.Resources;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result



/** DeviceAnalysisPlugin */
class DeviceAnalysisPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

   override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "maks.kyrychok/screensize")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "getScreenSize") { 
           
           val width = Resources.getSystem().getDisplayMetrics().widthPixels; 
           val height = Resources.getSystem().getDisplayMetrics().heightPixels; 
           
           val screenSize = height.toString() + " x " + width.toString()
            result.success(
             screenSize
        )
        } else {
            result.notImplemented()
        }
    }
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
