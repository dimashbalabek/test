import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passowrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              _TextContainer(),
              _TextFormFields(emailController, passowrController),
              _validateButtons(_formKey)
              
          
            ],
          ),
        ),
      ),
    );
  }
}



Widget _TextContainer(){
  return  SizedBox(
    width: 230,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/arl.png", width: 80, height: 80,),
        const Text("Welcome!",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900
        ),
        ),
        const Text("Hi! enter your details to get sign in to your account",
        style: TextStyle(

        ),
        )
      ],
    ),
  );
}
Widget _TextFormFields(emailController, passowrController){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter your email";
            }
            if(RegExp(r'@').hasMatch(value) == false){
              return "Please Enter your email right";
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: "Enter your email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
        ),

        TextFormField(
          controller: passowrController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter your password";
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: "Enter your password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
        ),
        TextButton(onPressed: (){}, child: Text("Forgot your password?"))
      ],
    ),
  );
}

Widget _validateButtons(GlobalKey<FormState> _formKey){
  return Column(
    children: [
      ElevatedButton(
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            
          }
        }, 
        child: Text("Login"),
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50))
        ),
        ),

      ElevatedButton(
        onPressed: (){}, 
        child: Text("Registration"),
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50))
        ),
        ),
    ],
  );
}