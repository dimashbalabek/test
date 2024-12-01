import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TaskerProfile extends StatefulWidget {
  const TaskerProfile({super.key});

  @override
  State<TaskerProfile> createState() => _TaskerProfileState();
}

class _TaskerProfileState extends State<TaskerProfile> {
  Map<String, dynamic> _ratings = {};
  String showCurrentR = "5stars";
  @override
  void initState() {
    super.initState();
    readjson();
  }
  Future<void> readjson() async{
    final String response = await rootBundle.loadString("assets/ratings.json");
    final Map<String, dynamic> data = await json.decode(response);
    setState(() {
      _ratings = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back)
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileContainer(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Reviews", style: TextStyle(fontSize: 22),),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                             setState(() {
                               showCurrentR = "5stars"; 
                             });                         
                          }
                          else if(index == 1){
                             setState(() {
                               showCurrentR = "4stars"; 
                             });  
                          }
                          else if(index == 2){
                             setState(() {
                               showCurrentR = "3stars"; 
                             });  
                          }
                          print(_ratings["ratings"]["5stars"]["count"]);
                        },
                        child: Container(
                          color: Colors.amber,
                          width: 150,
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(5-index, (int index){return Icon(Icons.star);}),
                                ],
                              ),
                              Text("${(5-index) * 3} reviews"),
                            ],
                          ),
                        ),
                      );
                    },),
                ),

                Container(
                  color: Colors.amber,
                  height: 250,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: _ratings["ratings"][showCurrentR]["reviews"].length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.maxFinite,
                        color: Colors.pink,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 400,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/arl.png", width: 80,),
                                      Container(
                                        child: Column(
                                          children: [
                                            Text(_ratings["ratings"][showCurrentR]["reviews"][index]["name"]),
                                            Row(
                                              children: [...List.generate(_ratings["ratings"][showCurrentR]["reviews"][index]["rating"], (int index){return Icon(Icons.star);})],
                                      )
                                    ],
                                  ),
                                ),

                                Text(_ratings["ratings"][showCurrentR]["reviews"][index]["date"])

                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(_ratings["ratings"][showCurrentR]["reviews"][index]["review"])
                          ],
                        ),
                      );
                    },
                    )
                  )


                
                ]
              ),
          ),


        ],
      ),
    );
  }
}

Widget _profileContainer(){
  return Container(
    color: Colors.white,
    padding: EdgeInsets.all(12),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20, bottom: 12),
              child: Image.asset("assets/arl.png", width: 80,)
              ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.purple[300]
                      ),
                      child: Text("Elite tasker"),
                    ),
                    Container(
                      margin: EdgeInsets.all(6),
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.pink[300]
                      ),
                      child: Text("5.0 reviews"),
                    )
                  ],
                ),
                Text("Ashley Robinson"),
              ],
            )
          ],
        ),


        Text("alskdm aksndakm msdkoa sdlka sok daosd aoks dka sdokas doa sdlj als dlaks mdla sdlkak sdla sdl asld alksk dla dl asld alsk dlas dla sdla")
      ],
    ),
  );
}