import 'package:flutter/material.dart';
class Card1 extends StatelessWidget {
  final String Image;
  final int Id;
  final String Name;
  final String Prize;
  final String Description;
  Card1({this.Image,this.Id,this.Name,this.Prize,this.Description});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      // decoration: BoxDecoration(
      //   border:Border.all(color: Colors.redAccent),
      // ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(12.0),
             padding: EdgeInsets.all(0.0),
             height:  200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(Image),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Text("ID: ${Id}",style: TextStyle(fontSize:20),),
          Text("Name: ${Name}",style: TextStyle(fontSize:20),),
          Text("Prize: ${Prize}",style: TextStyle(fontSize:20),),
          Text("Description: ${Description}",style: TextStyle(fontSize:20),),

        ],
      ),

    );
  }
}