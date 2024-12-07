import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences servisi
class SharedPrefsService {
  /// Singleton servis örneği
  static final SharedPrefsService _instance = SharedPrefsService._internal();

  /// Singleton servis örneğine erişmek için kullanılır
  factory SharedPrefsService() => _instance;
  SharedPrefsService._internal();

  SharedPreferences? _prefs;

  /// Başlangıçta SharedPreferences'ı yükler
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Token'ı SharedPreferences'a kaydeder. Kullanıcı giriş yaptığında kullanılır.
  Future<void> saveToken(String token) async {
    await _prefs?.setString('auth_token', token);
  }

  /// SharedPreferences'tan token'ı alır.
  String? get token => _prefs?.getString('auth_token');

  /// SharedPreferences'tan token'ı siler. Kullanıcı çıkış yaptığında kullanılır.
  Future<void> clearToken() async {
    await _prefs?.remove('auth_token');
  }
}
