import 'dart:convert';
import 'package:shoppiing_cart/model/shopping_card.dart';
import 'package:shoppiing_cart/model/List.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart 'as http;
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
{
  List shoppingList = [];
  Future<List> getListFromServer() async{
    try {
      http.Response response = await http.get(

          "https://raw.githubusercontent.com/ManishaNagarkoti11/shoppingList/main/dummydataforshopping");
      if (response.statusCode == 200) {
        final List jsonDecodeData = jsonDecode(response.body);
        jsonDecodeData.forEach((element) {
          ShoppingList lists = ShoppingList.fromJsonToInstance(element);
          shoppingList.add(lists);
        });
        return shoppingList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: this.getListFromServer(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot){
            //print(asyncSnapshot.hasError);
            if(asyncSnapshot.hasData){
              List data = asyncSnapshot.data;
              return ListView.builder(itemCount:data.length,
                  itemBuilder: (context ,int i)
                  {
                    //return Text("e");
                    return Card1(
                      Image:data[i].Image,
                      Id: data[i].Id,
                      Name: data[i].Name,
                      Prize: data[i].Prize,
                      Description: data[i].Description,
                    );
                  });
            }else if(asyncSnapshot.hasError){
              print(asyncSnapshot.error);
              return Container(
                alignment: Alignment.center,
                child: Text("Error"),
              );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
