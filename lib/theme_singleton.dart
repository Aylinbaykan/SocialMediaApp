// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:socialmedia/Static/color_class.dart';
import 'package:socialmedia/service/theme_service.dart';

import 'app/app.locator.dart';

class ThemeColorSingleton extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();
  late Color primaryBackgroundColor;
  late Color primarytextColor;
  late Color secondaryTextColor;
  late Color textfieldLabelTextColor;
  late Color textFieldBorderColor;
  late Color textFieldErrorColor;
  late Color textFieldTapColor;
  late Color buttonDisableColor;
  late Color buttonEnableColor;
  late Color buttonColor;
  late Color walletTabBackgroundColor;
  late Color cardBorderColor;
  late Color creditTitleColor;
  late Color textFieldColor;

  late Color cupertinoPickerBackgrounColor;
  late Color memberShipTitleBackgroundColor;

  late SvgPicture icon;
  late SvgPicture appBarIcon;

  ThemeColorSingleton(BuildContext context) {
    if (!_themeService.isLightMode) {
      primaryBackgroundColor = ColorClass.darkBackgroundColor;
      primarytextColor = ColorClass.darkBackgroundColor;
      secondaryTextColor = const Color(0xff1E1E1E);
      textfieldLabelTextColor = ColorClass.lightGray2;
      textFieldBorderColor = ColorClass.lightGray6;
      textFieldErrorColor = ColorClass.red1;
      textFieldTapColor = ColorClass.yellow1;
      buttonDisableColor = ColorClass.lightGray4;
      buttonEnableColor = ColorClass.yellow1;
      buttonColor = ColorClass.darkBackgroundColor;
      cardBorderColor = Color.fromARGB(255, 245, 242, 242);
      creditTitleColor = ColorClass.darkBackgroundColor;
      textFieldColor = ColorClass.darkBackgroundColor;

      cupertinoPickerBackgrounColor = ColorClass.darkGrey1;
      memberShipTitleBackgroundColor = Colors.black;
      walletTabBackgroundColor = Colors.black;

      //icon = SvgPicture.asset("assets/icons/grayIcon.svg");

      // appBarIcon = SvgPicture.asset(
      //   "assets/icons/defaultIcon.svg",
      //   height: 30,
      // );
    } else {
      primaryBackgroundColor = Colors.white;
      primarytextColor = ColorClass.darkBackgroundColor;
      secondaryTextColor = const Color(0xff1E1E1E);
      textfieldLabelTextColor = ColorClass.darkGrey6;
      textFieldBorderColor = ColorClass.lightGray6;
      textFieldErrorColor = ColorClass.red1;
      textFieldTapColor = ColorClass.yellow1;
      buttonDisableColor = ColorClass.darkGrey3;
      buttonEnableColor = ColorClass.yellow1;
      buttonColor = ColorClass.darkBackgroundColor;
      cardBorderColor = Color.fromARGB(255, 245, 242, 242);
      creditTitleColor = ColorClass.darkBackgroundColor;
      textFieldColor = ColorClass.darkBackgroundColor;

      cupertinoPickerBackgrounColor = ColorClass.lightGray1;
      memberShipTitleBackgroundColor = ColorClass.lightGray1;
      walletTabBackgroundColor = ColorClass.yellow1;

      // icon = SvgPicture.asset("assets/icons/darkIcon.svg");
      // appBarIcon = SvgPicture.asset(
      //   "assets/icons/defaultIconLight.svg",
      //   height: 30,
      // );
    }
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];
}

class ThemeTextStyleSingleton {
  static TextStyle primarytextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      bool underlined = false,
      double height = 1.5,
      FontStyle fontStyle = FontStyle.normal,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
      color: ThemeColorSingleton(context).textFieldColor,
      fontSize: size.fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: height,
      decoration: underlined ? TextDecoration.underline : null,
      letterSpacing: letterSpacing.letterSpacing,
    );
  }

  static TextStyle blackTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      bool underlined = false,
      double height = 1.5,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
      color: Colors.black,
      fontSize: size.fontSize,
      fontWeight: fontWeight,
      height: height,
      decoration: underlined ? TextDecoration.underline : null,
      letterSpacing: letterSpacing.letterSpacing,
    );
  }

  static TextStyle reverseColorPrimaryTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      bool underlined = false,
      double height = 1.5,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
      color: ThemeColorSingleton(context).primaryBackgroundColor,
      fontSize: size.fontSize,
      fontWeight: fontWeight,
      height: height,
      decoration: underlined ? TextDecoration.underline : null,
      letterSpacing: letterSpacing.letterSpacing,
    );
  }

  static TextStyle secondaryTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      bool underlined = false,
      double height = 1,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
        color: ThemeColorSingleton(context).secondaryTextColor,
        fontSize: size.fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing.letterSpacing,
        decoration: underlined ? TextDecoration.underline : null,
        height: height);
  }

  static TextStyle errorTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      double height = 1,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
        color: ThemeColorSingleton(context).textFieldErrorColor,
        fontSize: size.fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing.letterSpacing,
        height: height);
  }

  static TextStyle greenTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      double height = 1,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
        color: ColorClass.successGreen,
        fontSize: size.fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing.letterSpacing,
        height: height);
  }

  static TextStyle textFieldLabelTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      double height = 1,
      bool underlined = false,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
        color: ThemeColorSingleton(context).textFieldColor,
        fontSize: size.fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing.letterSpacing,
        decoration: underlined ? TextDecoration.underline : null,
        height: height);
  }

  static TextStyle yellowTextStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline7,
      FontWeight fontWeight = FontWeight.w400,
      bool underlined = false,
      double height = 1.5,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
      color: ColorClass.yellow1,
      fontSize: size.fontSize,
      fontWeight: fontWeight,
      height: height,
      decoration: underlined ? TextDecoration.underline : null,
      letterSpacing: letterSpacing.letterSpacing,
    );
  }
}

enum CustomFontSize {
  headline9(13),
  headline8(14),
  headline7(16),
  headline6(17),
  headline5(20),
  headline4(22),
  headline3(24),
  headline1(32),
  walletViewSize(56);

  final double fontSize;

  const CustomFontSize(this.fontSize);
}

enum CustomLetterSpacing {
  small(-0.2),
  medium(-0.5);

  final double letterSpacing;

  const CustomLetterSpacing(this.letterSpacing);
}
