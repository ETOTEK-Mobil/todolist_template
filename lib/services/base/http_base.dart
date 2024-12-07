import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/services/routes/api_routes.dart';
import 'package:todolist/services/shared_prefs_service.dart';

/// HTTP isteklerini yönetmek için temel bir sınıf. Bu temel sınıf sayesinde tokenları tekrar tekrar yazmamız gerekmez.
class HttpBase {
  /// HTTP isteklerinde kullanılacak header'lar
  final Map<String, String> headers;

  final userToken = SharedPrefsService().token;

  HttpBase({this.headers = const {'Content-Type': 'application/json'}}) {
    // Eğer giriş yapılmışsa header'a ekler.
    if (userToken != null) {
      headers['Authorization'] = 'Bearer $userToken';
    }
  }

  /// GET isteği yapar.
  Future<http.Response> get(ApiRoutes route) async {
    return http.get(route.uri, headers: headers);
  }

  /// POST isteği yapar.
  Future<http.Response> post(ApiRoutes route, Map<String, dynamic> data) async {
    return http.post(
      route.uri,
      headers: headers,
      body: jsonEncode(data),
    );
  }
}
