import 'package:flutter/material.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key});

  @override
  State<RegisterPage1> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage1> {
  final _formKey = GlobalKey<FormState>();
  final genderList = ["Male", "Female"];
  String _dropDownButtonValue = "Male";
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(

              ),
              DropdownButton(
                icon: isMale? Icon(Icons.male) : Icon(Icons.female),
                elevation: 8,
                items: [
                  DropdownMenuItem(child: Text(genderList[0]), value: genderList[0],),
                  DropdownMenuItem(child: Text(genderList[1]), value: genderList[1],),
                  ], 
                onChanged: (String? newValue){
                  setState(() {
                    _dropDownButtonValue = newValue!;
                    isMale =! isMale;
                  });
                },
                value: _dropDownButtonValue,
                )

            ],
          ),
        ),
        ),
    );
  }
}