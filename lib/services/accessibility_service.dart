// accessibility_service.dart

import 'package:flutter/services.dart';

class AccessibilityService {
  static const platform = MethodChannel('com.example.app/accessibility');

  static Future<void> configureInputs() async {
    try {
      await platform.invokeMethod('configureInputs');
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }
}
