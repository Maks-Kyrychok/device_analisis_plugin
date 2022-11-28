import 'package:device_analysis/screen_syze_analysis.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _screenSize = 'Unknown';
  Map<String, String> _deviceParameters = {};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String screenSize;
    Map<String, String> deviceParameters = {
      'system': 'Windows',
      'cpu': 'intel21w',
      'Screen size': '1920 x 1080'
    };

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      screenSize = await ScreenSizeAnalisis.getScreenSize();
    } catch (e) {
      screenSize = '$e';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _screenSize = screenSize;
      _deviceParameters = deviceParameters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device analysis app'),
        ),
        body: Center(
            child: Column(
          children: [
            Text('Screen size: $_screenSize\n'),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _deviceParameters.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = _deviceParameters.keys.elementAt(index);
                  return Column(
                    children: [
                      ListTile(
                        title: Text(key),
                        subtitle: Text('${_deviceParameters[key]}'),
                      )
                    ],
                  );
                })
          ],
        )),
      ),
    );
  }
}
