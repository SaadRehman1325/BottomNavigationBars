import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5E0B7),
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Text('Screen 4'),
            )));
  }
}
