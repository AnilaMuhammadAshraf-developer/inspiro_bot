import 'package:flutter/material.dart';
import 'package:inspiro_bot/constants/app_list.dart';
import 'package:inspiro_bot/utils/app_color.dart';
import 'package:inspiro_bot/widgets/custom_app_bar.dart';
import 'package:inspiro_bot/widgets/custom_bottom_bar.dart';

class MasterScreen extends StatefulWidget{
   MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int selectedIndex=0;

 void onTap(index){
      setState(() {
        selectedIndex=index;
      });
 }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: AppColor.appQouteBoxColor,
      // appBar: CustomAppbar(title:AppList.bottomList[selectedIndex]['label'],),
      body:  AppList.bottomList[selectedIndex]['screen'],
    
      bottomNavigationBar:CustomBottomBar(selectedIndex: selectedIndex, onTap: onTap) ,
    );
  }
}