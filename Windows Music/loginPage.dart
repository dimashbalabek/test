import 'package:flutter/material.dart';
import 'package:flutter_lvl2_preperation/HomeScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        centerTitle: true,
        title: Text("USED ZIP"),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 32, left: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/shop.jpg", height: 150,),
              Text("Let's Sign in"),
              ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return HomeScreen();}));}, child: Text("Sign in", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(minimumSize: Size(240, 40)),),
              Container(
                width: 240,
                child: Row(
                  children: [
                    Expanded(child: Divider(thickness: 1,)),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider(thickness: 1,))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return HomeScreen();}));}, child: Text("        Sign Up        " , style: TextStyle(fontSize: 12),)),
                  ElevatedButton(onPressed: (){}, child: Text("Password Reset", style: TextStyle(fontSize: 12)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}