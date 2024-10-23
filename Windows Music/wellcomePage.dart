import 'package:flutter/material.dart';
import 'package:flutter_lvl2_preperation/loginPage.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){return LoginPage();}));},
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Wellcome to"),
              Text("USED ZIP", style: TextStyle(fontWeight: FontWeight.w900),),
              Image.asset("assets/shop.jpg"),
              Text("Best used trading anywhere in the world")
            ],
          ),
        ),
      ),
    );
  }
}