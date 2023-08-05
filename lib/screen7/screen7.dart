import 'package:flutter/material.dart';

class Screen7 extends StatelessWidget {
  const Screen7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Text('Screen 7'),
            )));
  }
}
