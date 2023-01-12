import 'package:flutter/material.dart';
import 'package:socialmedia/theme_singleton.dart';

class AppBars {
  static PreferredSizeWidget customAppBarWithTitle(
      {required BuildContext context,
      required String title,
      bool hideNotifications = false}) {
    var actions = <Widget>[];
    if (!hideNotifications) {
      actions = [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none_outlined,
            size: 25,
            color: ThemeColorSingleton(context).primarytextColor,
          ),
        ),
      ];
    }
    return AppBar(
      shape: Border(bottom: BorderSide(color: Colors.yellow, width: 2)),
      elevation: 0,
      backgroundColor: ThemeColorSingleton(context).primaryBackgroundColor,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: ThemeColorSingleton(context).primarytextColor,
          icon: const Icon(Icons.arrow_back_ios, size: 25)),
      centerTitle: true,
      title: Text(
        title,
        style: ThemeTextStyleSingleton.primarytextStyle(
          context: context,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
