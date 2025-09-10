import 'package:flutter/material.dart';

class QouteProvider with ChangeNotifier{
  List<Map<String,dynamic>> qouteFavList=[];
  int _isAdd=0;
  int  get isAdd => _isAdd;

 void add(String text){

   var existingItem = qouteFavList.firstWhere(
    (item) => item["qoute"] == text,
    orElse: () => {}, 
  );
    
  if(existingItem.isNotEmpty){
    _isAdd=2;
      delete(existingItem["id"]);
  }else{
    _isAdd=1;
       int newId = qouteFavList.isEmpty ? 1 : qouteFavList.last["id"] + 1;
   qouteFavList.add({
    "id":newId,
    "qoute":text
   });
  }
 } 


 void delete(int id){
    qouteFavList.removeWhere((item)=>item["id"]==id);
 }

 List<Map<String, dynamic>> getQoute(){
  return qouteFavList;
 }


}