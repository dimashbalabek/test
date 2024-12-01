import 'package:flutter/material.dart';
import 'package:lvl4_flutter_demo_practise/Sign_In_Page.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){ return RegisterPage();}));});
    return Scaffold(
      body: Center(
        child: Image.network("assets/arl.png"),
      ),
    );
  }
}