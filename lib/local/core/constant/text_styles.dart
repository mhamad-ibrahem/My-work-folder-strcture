import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';

TextStyle primaryTextStyle(
    {required bool isUnderLine, required BuildContext context}) {
  return GoogleFonts.inter(
    textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
          color: AppColors.primaryColor,
          decoration: isUnderLine == true
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
  );
}

TextStyle buttonTextStyle({required BuildContext context}) {
  return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColors.white,
            fontSize: 15,
          ));
}

TextStyle textFormStyle({required BuildContext context}) {
  return GoogleFonts.inter(
    textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
          color: AppColors.black,
          fontSize: 15,
        ),
  );
}

TextStyle appBarStyle({required BuildContext context}) {
  return GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColors.black,
            fontSize: 15,
          ));
}
