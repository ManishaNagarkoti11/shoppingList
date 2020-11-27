import 'package:flutter/foundation.dart';

class ShoppingList{
  final String Image;
  final  int Id;
  final String Name;
  final String Prize;
  final String Description;

  ShoppingList({this.Image, this.Id, this.Name,this.Prize ,this.Description});
  factory ShoppingList.fromJsonToInstance(Map<String,dynamic>data){
    return ShoppingList(
      Image: data['Image'],
      Id: data['Id'],
      Name: data['Name'],
      Prize: data['Prize'],
      Description: data['Description'],
    );
  }
}
