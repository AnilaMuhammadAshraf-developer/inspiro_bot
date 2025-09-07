import 'package:flutter/material.dart';
import 'package:inspiro_bot/utils/app_color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF6F3B82), Color(0xFF9B59B6)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  ),
  child:
     AppBar(
       backgroundColor: Colors.transparent, 
    elevation: 0,
    
      centerTitle: true,
      title:
          title != null
              ? Text(title!, style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.appWhiteColor))
              : null,
     ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
