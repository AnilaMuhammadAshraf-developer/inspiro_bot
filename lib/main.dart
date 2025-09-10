import 'package:flutter/material.dart';
import 'package:inspiro_bot/providers/qoute_provider.dart';
import 'package:inspiro_bot/screens/splash.dart';
import 'package:inspiro_bot/utils/app_string.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QouteProvider()),
       
      ],
      child:const MyApp());
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