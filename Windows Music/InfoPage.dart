import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final  data;
  const InfoPage({super.key, required this.data});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.data.name)),
      body: Center(
        child: Column(
          children: [
            Image.asset(widget.data.img, height: 100,),
            Container(
              width: 400,
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.data.name),
                  Text(widget.data.text, )
                ],
              ))
          ],
        ),
      ),
    );
  }
}