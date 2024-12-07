import 'package:todolist/services/constants/api_constants.dart';

enum ApiRoutes {
  login,
  register,
}

extension ApiRoutesExtension on ApiRoutes {
  String get route {
    switch (this) {
      case ApiRoutes.login:
        return '/login';
      case ApiRoutes.register:
        return '/register';
    }
  }

  /// ApiRoutes'e göre url oluşturur.
  String get url {
    return '${ApiConstants.baseUrl}/api/parents$route';
  }

  /// ApiRoutes'e göre uri oluşturur.
  Uri get uri {
    return Uri.parse(url);
  }
}
