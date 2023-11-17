import 'package:get/get.dart';
import 'package:new_structure/global/core/api/dio_crud.dart';

import 'package:new_structure/global/core/api/http_crud.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // to injection the crud class from the start of the application work
    Get.put(HttpCrud());
    Get.put(DioCrud());
  }
}
