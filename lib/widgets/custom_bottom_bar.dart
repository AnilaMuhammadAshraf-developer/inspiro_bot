import 'package:flutter/material.dart';
import 'package:inspiro_bot/constants/app_list.dart';
import 'package:inspiro_bot/utils/app_color.dart';

class CustomBottomBar extends StatelessWidget{
  final int selectedIndex;
  final Function(int) onTap;
   CustomBottomBar({super.key, required this.selectedIndex,required this.onTap});

  @override
  Widget build(BuildContext context){
    return Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF6F3B82), Color(0xFF9B59B6)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
  child:
     BottomNavigationBar(
    backgroundColor: Colors.transparent, 
    elevation: 0, 
      currentIndex: selectedIndex,
         type: BottomNavigationBarType.fixed,
         selectedItemColor: AppColor.appWhiteColor,
         unselectedItemColor: AppColor.appWhiteColor,
      onTap: onTap,
      items:List.generate(AppList.bottomList.length,(index){
        var item=AppList.bottomList[index];
        return BottomNavigationBarItem(icon:item['icon'],label: item['label']);
      })
     )
    );
  }
}