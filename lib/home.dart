import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Portfolio App"),
      ),
      body: Center(
        child: Text(
          'Welcome to My Portfolio!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
