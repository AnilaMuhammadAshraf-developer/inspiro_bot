import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inspiro_bot/utils/app_color.dart';
import 'package:inspiro_bot/utils/app_string.dart';
import 'package:inspiro_bot/widgets/gradient_background.dart';

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

  @override
  Widget build(BuildContext context) {
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
          qouteBox(context),
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

  Widget qouteBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
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
        children: [
          Text(
            quote,
            style: TextStyle(color: AppColor.appWhiteColor, fontSize: 19),
          ),
          Spacer(),
          Center(child:Text(author,style: TextStyle(color:AppColor.appWhiteColor )))
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
