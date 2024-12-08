import 'package:todolist/services/base/http_base.dart';

/// Yetkilendirme işlemlerini yönetmek için kullanılan sınıf.
/// Bu sınıf, [HttpBase] sınıfını temel alır bu sayede [HttpBase] sınıfındaki metotları kullanabilir.
class AuthService {
  final HttpBase _httpBase = HttpBase();
}
