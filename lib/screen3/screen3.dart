import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Text('Screen 3'),
            )));
  }
}
