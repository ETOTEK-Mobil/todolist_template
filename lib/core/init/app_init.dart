import 'package:todolist/services/shared_prefs_service.dart';

class AppInit {
  static Future<void> init() async {
    await SharedPrefsService().init();
  }
}
