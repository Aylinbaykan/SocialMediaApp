// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Package imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia/UI/RootPage/root_page_view.dart';
import 'package:socialmedia/theme_singleton.dart';

class CustomProfilePhoto extends StatelessWidget with RootPage {
  final double? width;
  final double? height;
  final double borderRadius;
  final String imageUrl;

  const CustomProfilePhoto({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget rootWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
