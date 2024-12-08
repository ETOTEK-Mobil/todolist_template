import 'package:flutter/material.dart';
import 'package:todolist/services/base/http_base.dart';
import 'package:todolist/services/shared_prefs_service.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPrefsService().init();
    HttpBase(token: SharedPrefsService().token);
  }
}
