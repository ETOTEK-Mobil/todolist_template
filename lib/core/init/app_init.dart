import 'package:flutter/material.dart';
import 'package:todolist/services/shared_prefs_service.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPrefsService().init();
  }
}
