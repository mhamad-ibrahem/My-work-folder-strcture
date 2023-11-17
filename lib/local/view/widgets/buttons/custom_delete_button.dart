import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_structure/local/view/shared/widgets/loading/loading_points.dart';
import '../../../core/constant/colors.dart';

class CustomExitButton extends StatelessWidget {
  const CustomExitButton({
    super.key,
    this.color,
    this.radius,
    this.onTap,
    this.isLoading = false,
  });
  final Color? color;
  final double? radius;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.back();
          },
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundColor: color ?? AppColors.red.withOpacity(0.7),
        child: isLoading
            ? const LoadingPoint()
            : const Center(
                child: Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
