import 'package:get/get.dart';

import '../controllers/upc_controller.dart';

class UpcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpcController>(
      () => UpcController(),
    );
  }
}
