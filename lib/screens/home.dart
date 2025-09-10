import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inspiro_bot/providers/qoute_provider.dart';
import 'package:inspiro_bot/utils/app_color.dart';
import 'package:inspiro_bot/utils/app_dialogs.dart';
import 'package:inspiro_bot/widgets/gradient_background.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    
  bool _loading=false;
   String quote = "Click the button to generate an AI quote!";
   String author="";

    Future<void> getQoute() async {
    setState(() => _loading = true);
    print("function k andr:");
   
    final url = Uri.parse(
        "https://zenquotes.io/api/random"); 
   

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
         _loading=false;
        quote = data[0]['q'];
        author=data[0]['a'];
      });
    } else {
      setState(() {
        _loading=false;
        quote = "Failed to fetch AI quote!";
        author="";
      });
    }
  }
  
  void makeFav(qouteProvider){
    print("mark fav");
    if(qouteProvider.isAdd==1){
    AppDialogs().showCustomDialog(context, "Success", "Qoute added to your favourite list Successfully.",() );
    }else{
       AppDialogs().showCustomDialog(context, "Success", "Qoute removed from your favourite list Successfully.",() );
    }
  }
  @override
  Widget build(BuildContext context) {
    final qouteProvider = Provider.of<QouteProvider>(
      context,
      listen: false,
    );
    return GradientBackground(
      child: Column(
        children: [
          SizedBox(height: 9),
          Center(
            child: Text(
              "Home",
              style: TextStyle(
                color: AppColor.appWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 20),
          qouteBox(context,qouteProvider),
          SizedBox(height: 20),
            _loading ? CircularProgressIndicator(
            color: AppColor.appWhiteColor,
          ) : SizedBox.shrink(),
          SizedBox(height: 10,),
          customButton(context),
        
        ],
      ),
    );
  }

  Widget qouteBox(BuildContext context,qouteProvider) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            AppColor.appQouteBoxColor,
            const Color.fromARGB(255, 125, 64, 147),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              
       
         Padding(
          padding: EdgeInsets.only(top:40,right:10,left:10),
        child: Text(
            quote,
            style: TextStyle(color: AppColor.appWhiteColor, fontSize: 19,),
            textAlign: TextAlign.center,
          ),
         ),
           Positioned(
            top: 0,
            right:0,
           
          child:IconButton(onPressed:()=>makeFav(qouteProvider), icon: Icon(Icons.favorite_outline,color: AppColor.appWhiteColor,)),
          ),
            ],
          ),
         SizedBox(height: 5,),
          Spacer(),
          Padding(padding: EdgeInsets.only(bottom: 10),
         child: Center(child:Text(author,style: TextStyle(color:AppColor.appWhiteColor ))))
        ],
      ),
    );
  }

  Widget customButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.appBtnColor,
      ),
      child: InkWell(
        onTap:getQoute,
        child: Center(
          child: Text(
            "Get New Qoute",
            style: TextStyle(
              color: AppColor.appWhiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          
          ),
        ),
      ),
    );
  }
}
