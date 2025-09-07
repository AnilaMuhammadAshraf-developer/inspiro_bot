import 'package:flutter/material.dart';
import 'package:inspiro_bot/screens/splash.dart';
import 'package:inspiro_bot/utils/app_string.dart';


void main(){
   runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         title: AppString.appTitle,
         home: SplashScreen(),
    );
  }
}