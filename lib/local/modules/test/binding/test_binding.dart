import 'package:get/get.dart';
import 'package:new_structure/local/modules/test/controller/test_controller.dart';

class TestBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TestController());
  }
}
