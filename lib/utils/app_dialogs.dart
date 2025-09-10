import 'package:flutter/material.dart';
import 'package:inspiro_bot/utils/app_color.dart';



class AppDialogs{

  Future showCustomDialog(BuildContext context,heading,message,onTapFunction){
    return   showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height:50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:AppColor.appQouteBoxColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child:Center(
                      child:Text(
                   heading,textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:AppColor.appWhiteColor),
                  ),
                      ),
                  ),
                   
                  Icon(Icons.check_circle, color: AppColor.appBtnColor, size: 120),
                
                 
                 
                  Padding(padding: EdgeInsets.only(right:10,left:10),
                  child: Text(message,textAlign: TextAlign.center,),
                  ),
                
                 Padding(padding: EdgeInsets.only(right:10,left:10),
                  child:SizedBox(
                    
                    width: double.infinity,
                  child:ElevatedButton(
            
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.appGradientColor1,
                    ),
                      
                    onPressed:()=>onTapFunction(context),
                
                    child: Text(
                      "Ok",
                      style: TextStyle(color: AppColor.appWhiteColor),
                    ),
                  ),
                  ),
                 ),
                ],
              ),
            ),
          );
        });
  }


  
}