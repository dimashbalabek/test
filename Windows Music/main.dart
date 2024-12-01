import 'package:flutter/material.dart';
import 'package:lvl4_flutter_demo_practise/HomePage.dart';
import 'package:lvl4_flutter_demo_practise/RegisterPage.dart';
import 'package:lvl4_flutter_demo_practise/Sign_In_Page.dart';
import 'package:lvl4_flutter_demo_practise/TaskerProfile.dart';
import 'package:lvl4_flutter_demo_practise/WellcomePage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }  
} 