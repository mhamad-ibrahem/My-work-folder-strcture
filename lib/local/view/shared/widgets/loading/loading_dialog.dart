import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/Constant/Colors.dart';

showLoadingDialog() {
  return Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ));
}
