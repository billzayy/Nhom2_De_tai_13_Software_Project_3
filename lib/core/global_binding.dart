import 'package:get/get.dart';
import 'package:software_project_3/config/noti_config.dart';
import 'package:software_project_3/config/tintuc_config_implement.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';
import 'package:software_project_3/src/infrastructure/repositories/user_repository.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoTiConfig>(() => NoTiConfigImplement(), fenix: true);
    Get.lazyPut<UserService>(() => UserRepository(), fenix: true);
    final client = ApiClient()
      ..init(baseUrl: 'http://34.142.131.182:27680/api');
    Get.put<ApiClient>(client);
  }
}
