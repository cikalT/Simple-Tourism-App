import 'dart:io';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../models/screen_arguments.dart';

class BaseController extends GetxController with WidgetsBindingObserver {
  bool _isLoading = false;

  ScreenArguments? screenArguments;

  bool get isLoading => _isLoading;

  set isLoading(val) {
    _isLoading = val;
    update();
  }

  @override
  onInit() async {
    await initArguments();
    super.onInit();
  }

  @override
  void onReady() async {
    //
    super.onReady();
  }

  @override
  onClose() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        if (Platform.isAndroid) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );
        }
      }
      return msg;
    });
    super.onClose();
  }

  handleSystemChannel(msg) {
    print('SystemChannels> $msg');
  }

  initArguments() async {
    if (Get.arguments != null) {
      if (Get.arguments is ScreenArguments) {
        screenArguments = Get.arguments as ScreenArguments;
      }
    }
  }

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
