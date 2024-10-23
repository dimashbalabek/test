import 'package:flutter/material.dart';
import 'package:flutter_lvl2_preperation/InfoPage.dart';
import 'package:flutter_lvl2_preperation/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        actions: [Icon(Icons.notifications_on)],
        leading: Icon(Icons.search),
        centerTitle: true,
        title: Text("Korea - GoYang", style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
          Image.asset("assets/s.jpg"),
          product_list_builder(datas1),
          product_list_builder(datas2),
          product_list_builder(datas3)
          
          
        ],
      )
    );
  }
}

Widget product_box_builder(context, index, data_type){
  return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){ return InfoPage(data: data_type);})),
    child: Container(
      margin: EdgeInsets.only(right: 28, left: 28),
      height: 140,
      width: 200,
      color: Colors.amber,
      child: Column(
        children: [
          Image.asset(data_type.img, width: 75,),
          Text(data_type.name),
          Text(data_type.text),
          Text(data_type.price)
    
        ],
      ),
      
    ),
  );
}
Widget product_list_builder(data_list_type){
  return Container(
    color: Colors.black26,
    height: 200,
    child: ListView.builder(
    scrollDirection: Axis.horizontal  ,
    itemCount: data_list_type.length,
    itemBuilder: (context, index) {
      return product_box_builder(context, index, data_list_type[index]);
              },
            ),
          );
}