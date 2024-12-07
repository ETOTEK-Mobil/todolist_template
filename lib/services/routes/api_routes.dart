import 'package:todolist/services/constants/api_constants.dart';

enum ApiRoutes {
  login,
  register,
  tasks,
}

extension ApiRoutesExtension on ApiRoutes {
  String get route {
    switch (this) {
      case ApiRoutes.login:
        return '/login';
      case ApiRoutes.register:
        return '/register';
      case ApiRoutes.tasks:
        return '/tasks';
    }
  }

  /// ApiRoutes'e göre url oluşturur.
  String get url {
    return '${ApiConstants.baseUrl}/$route';
  }

  /// ApiRoutes'e göre uri oluşturur.
  Uri get uri {
    return Uri.parse(url);
  }
}
