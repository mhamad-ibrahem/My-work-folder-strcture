import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.icon,
    this.label,
    this.hint,
    this.obscure = false,
    this.textEditingController,
    this.validator,
    this.inputType,
    this.suffixIcon,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.numberOfLines,
    this.isEnable = true,
    this.onFieldSubmitted,
    this.isReadOnly = false,
    this.isField = false,
    this.onLeadingTap,
  }) : super(key: key);
  final Widget? icon;
  final String? label;
  final String? hint;
  final bool obscure;
  final TextInputType? inputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final void Function(String)? onChange;
  final int? numberOfLines;
  final void Function()? onTap;
  final void Function()? onLeadingTap;
  final FocusNode? focusNode;
  final bool isEnable;
  final void Function(String)? onFieldSubmitted;
  final bool isReadOnly;
  final bool isField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChange,
      controller: textEditingController,
      validator: validator,
      style: textFormStyle(context: context),
      obscureText: obscure,
      enabled: isEnable,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: isReadOnly,
      maxLines: numberOfLines ?? 1,
      cursorColor: AppColors.deepGrey,
      keyboardType: inputType,
      decoration: InputDecoration(
          fillColor: AppColors.deepGrey,
          enabled: isEnable,
          filled: isField,
          suffixIcon: suffixIcon,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: onLeadingTap,
              child: icon,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.displaySmall,
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.primaryColor, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.red, width: 2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
