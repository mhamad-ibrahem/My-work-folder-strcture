import 'dart:developer';
import 'package:get/get.dart';
import 'package:new_structure/Global/core/class/app_toast.dart';
import '../../../../global/core/api/status_request.dart';
import '../../../view/shared/widgets/loading/loading_points.dart';
import '../data/test_data.dart';

class TestController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  TestData testData = TestData(Get.find());
  fetchData() async {
    log("start fetch");
    statusRequest = StatusRequest.loading;
    Get.dialog(
      const LoadingPoint(),
      barrierDismissible: false,
    );
    update();
    var response = await testData.getNewsData(query: 'language=en');
    response.fold((l) {
      Get.back();
      AppToasts.errorToast(l.message);
      statusRequest = StatusRequest.failure;
      update();
    }, (r) {
      Get.back();
      List json = r['articles'];
      log("article $json");
      statusRequest = StatusRequest.none;
      update();
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
