import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lvl4_flutter_demo_practise/TaskerProfile.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<dynamic> _items = [];
  List<dynamic> _items1 = [];
  List<dynamic> _items2 = [];
  List seachList = [];
  bool isSearchValueEmpty = true;
  bool isSearchActive = false;


  @override
  void initState() {
    super.initState();
    readjson1();
    readjson2();
    readjson3();
  }

  Future<void> readjson1() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final data = json.decode(response);
    setState(() {
      _items = data;
    });
    print(_items);
  }

  Future<void> readjson2() async {
    final String response = await rootBundle.loadString("assets/people.json");
    final data = json.decode(response);
    setState(() {
      _items1 = data;
    });
    
  }

    Future<void> readjson3() async {
    final String response = await rootBundle.loadString("assets/tasks.json");
    final data = json.decode(response);
    setState(() {
      _items2 = data;
    });
    
  }

  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Section
            Container(
    color: Colors.white,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSearchActive? SizedBox() : Image.asset(
              "assets/arl.png",
              width: 80,
              height: 80,
            ),
            isSearchActive? SizedBox() : Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
              ],
            ),
          ],
        ),2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Good Morning!"),
                Text("Ashley Robinson")
              ],
            ),

            GestureDetector(
              onTap: () {
                Navigator.push<void>(context,MaterialPageRoute<void>(builder: (BuildContext context) => const TaskerProfile(),),);
              },
              child: Image.asset("assets/arl.png", width: 120,)
              )
            
          ],
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              isSearchActive = true;
              seachList = [];
            });
            if (value.isEmpty){
              setState(() {
                isSearchValueEmpty = true;
                seachList = [];
              });
            }
            else{
              isSearchValueEmpty = false;
            for (var i = 0; i < _items2.length; i++) {
              String check = _items2[i]["title"];
              if (check.toLowerCase().split(" ").join("").contains(value.toLowerCase().split(" ").join(""))) {
                setState(() {
                  seachList.add(_items2[i]);
                  print("added Mis");
                });
              }
            }
          }
          },
          autofocus: false,
          onTap: (){
            if (isSearchActive == false) {
              setState(() {
                isSearchActive =! isSearchActive;
              });
            }
          },
          decoration: InputDecoration(
            icon: isSearchActive? 
            IconButton(
              onPressed: (){
                setState(() {
                  isSearchActive =! isSearchActive;
                });
              }, 
              icon: Icon(Icons.arrow_back)
              )
            :
            SizedBox(),
            labelText: "Search",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    ),
  ),

  // Search section end!

  
           isSearchActive? 
           Expanded(
            
             child: ListView(

              children: [
                ...List.generate(seachList.length, (int index){ 
                  return Container(
                    
                    child: ListTile(
                      
                      shape: Border(
                      ),
                      tileColor: Colors.amber,
                      title: Text(seachList[index]["title"]),
                      
                    ),
                  );
                 }),

                 isSearchValueEmpty? 
                 SizedBox()
                 :
                 Container(
                  child: Column(
                    children: [
                      Text("Other Tasks"),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: _items2.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_items2[index]["title"]),
                            );
                          },
                          ),
                      )
                    ],
                  ),
                 )
              ],
             ),
           )
           : 
           Expanded(
             child: ListView(
              children: [
                 _Popular(_items),
                 Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items1.length,
                    itemBuilder: (context, index) {
                      return People(_items1, index);
                    },
                    ),
                 )
              ],
             ),
           )
          ],
        ),
      ),
    );
  }
}









Widget _Popular(List items) {
  if (items.isEmpty) {
    return Text("No items available");
  }

  return Column(
    children: [
      Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PopularContainer(items, 0),
            SizedBox(width: 10,),
            _PopularContainer(items, 1)
          ],
        ),
      ),
      Divider(height: 20, color: Colors.transparent,),
      Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _PopularContainer(items, 2),
            SizedBox(width: 10,),
            _PopularContainer(items, 2)
          ],
        ),
      ),

    ],
  );
}


Widget _PopularContainer(List items, int index){
  return       Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(

          color: Colors.pink,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(items[index]['foods'][0]["name"]),
          ],
        ),
      );
}


Widget People(List people_List, int index){
  return Container(
    width: 200,
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      children: [
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiWBK12MsV9JYoCzjyeuEUGnD0v74F8xC_IA&s", width: 100,),
        Text(people_List[index]["name"])
      ],
    ),
  );
}














// Widget _Search(isSearchActive) {
//   return Container(
//     color: Colors.white,
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset(
//               "assets/arl.png",
//               width: 80,
//               height: 80,
//             ),
//             Row(
//               children: [
//                 IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
//                 IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
//               ],
//             ),
//           ],
//         ),
//         TextField(
//           onTap: (){
            
//           },
//           decoration: InputDecoration(
//             labelText: "Search",
//             prefixIcon: Icon(
//               Icons.search,
//               color: Colors.white,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: Colors.grey),
//             ),
//             filled: true,
//             fillColor: Colors.grey[200],
//           ),
//         ),
//       ],
//     ),
//   );
// }