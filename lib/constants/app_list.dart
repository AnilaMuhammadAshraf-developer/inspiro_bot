import 'package:flutter/material.dart';
import 'package:inspiro_bot/screens/home.dart';
import 'package:inspiro_bot/utils/app_color.dart';

class AppList {
  static const List<Map<String, dynamic>> bottomList = [
     {
      "label": "Home",
      "icon": Icon(Icons.home, color: AppColor.appWhiteColor),
      "screen": HomeScreen(),
    },
    {
      "label": "Favourites",
      "icon": Icon(Icons.favorite, color: AppColor.appWhiteColor),
      "screen": HomeScreen(),
    },
    {
      "label": "Share",
      "icon": Icon(Icons.share_sharp, color: AppColor.appWhiteColor),
      "screen": HomeScreen(),
    },
  ];
}
