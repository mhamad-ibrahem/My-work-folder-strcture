import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_structure/Local/Core/Constant/Colors.dart';
import 'package:new_structure/local/modules/test/controller/test_controller.dart';
import 'package:new_structure/local/view/widgets/pop_up/custom_dialog.dart';

import '../../../../view/widgets/fields/custom_text_form_field.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<TestController>(
            builder: (controller) => Column(children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: AppColors.green,
                  ),
                  SizedBox(
                      height: 50, width: 200, child: CustomTextFormField()),
                  MaterialButton(
                    onPressed: () {
                      // controller.fetchData();
                      customDialog(
                        child: Text(''),
                      );
                    },
                    color: AppColors.deepGrey,
                  ),
                ])));
  }
}
