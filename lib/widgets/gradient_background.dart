import 'package:flutter/material.dart';
import 'package:inspiro_bot/utils/app_color.dart';

class GradientBackground extends StatelessWidget{
  final Widget child;
  const GradientBackground({super.key,required this.child});
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[AppColor.appGradientColor2,AppColor.appQouteBoxColor],begin: Alignment.topLeft,end: Alignment.bottomRight)
      ),
      child: child,
    );
  }
}