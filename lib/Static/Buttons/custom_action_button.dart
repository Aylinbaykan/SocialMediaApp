// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia/UI/RootPage/root_page_view.dart';
import 'package:socialmedia/theme_singleton.dart';

class CustomActionButton extends StatelessWidget with RootPage {
  final String buttonText;
  //final Color? enabledBackground;
  final Color? backgroundColor;
  final Color? textColor;
  final CustomActionButtonHeight height;
  final Function() onTap;
  final bool isActive;
  final Color borderColor;
  final bool comingFromTab;
  final double? width;
  final CustomFontSize? textSize;

  const CustomActionButton(
      {Key? key,
      required this.buttonText,
      this.backgroundColor,
      //this.disabledBackground,
      this.textColor,
      this.width,
      this.textSize,
      required this.onTap,
      this.height = CustomActionButtonHeight.normal,
      this.borderColor = Colors.transparent,
      this.comingFromTab = false,
      this.isActive = false})
      : super(key: key);

  @override
  Widget rootWidget(BuildContext context) {
    var tempEnabledColor = backgroundColor ?? backgroundColor;

    return ElevatedButton(
      onPressed: () => comingFromTab || isActive ? onTap() : null,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(
            width ?? MediaQuery.of(context).size.width,
            height.height,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
            isActive ? backgroundColor : backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(width: 1, color: borderColor)),
        ),
      ),
      child: Text(buttonText,
          textAlign: TextAlign.center,
          style: textStyle(
              context: context, size: textSize ?? CustomFontSize.headline3)),
    );
  }

  TextStyle textStyle(
      {required BuildContext context,
      CustomFontSize size = CustomFontSize.headline3,
      FontWeight fontWeight = FontWeight.bold,
      double height = 1,
      CustomLetterSpacing letterSpacing = CustomLetterSpacing.medium}) {
    return GoogleFonts.quicksand(
        color: textColor != null
            ? textColor!
            : isActive
                ? Colors.black
                : Colors.white,
        fontSize: size.fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing.letterSpacing,
        height: height);
  }
}

enum CustomActionButtonHeight {
  low(40),
  medium(60),
  normal(80);

  final double height;

  const CustomActionButtonHeight(this.height);
}
