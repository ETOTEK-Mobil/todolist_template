import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/services/routes/api_routes.dart';

/// HTTP isteklerini yönetmek için temel bir sınıf. Bu temel sınıf sayesinde tokenları tekrar tekrar yazmamız gerekmez.
class HttpBase {
  /// HTTP isteklerinde kullanılacak header'lar
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  /// Giriş yapıldığında bu fonksiyon çağrılır ve token eklenir.
  Future<void> loginToken(String token) async {
    headers['Authorization'] = 'Bearer $token';
  }

  /// Çıkış yapıldığında bu fonksiyon çağrılır ve token silinir.
  Future<void> logoutToken() async {
    headers.remove('Authorization');
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

  /// PUT isteği yapar.
  Future<http.Response> put(ApiRoutes route, String id, Map<String, dynamic> data) async {
    return http.put(
      Uri.parse('${route.url}/$id'),
      headers: headers,
      body: jsonEncode(data),
    );
  }

  /// PATCH isteği yapar.
  Future<http.Response> patch(ApiRoutes route, String id, Map<String, dynamic> data) async {
    return http.patch(
      Uri.parse('${route.url}/$id'),
      headers: headers,
      body: jsonEncode(data),
    );
  }

  /// DELETE isteği yapar.
  Future<http.Response> delete(ApiRoutes route, String id) async {
    return http.delete(Uri.parse('${route.url}/$id'), headers: headers);
  }
}
