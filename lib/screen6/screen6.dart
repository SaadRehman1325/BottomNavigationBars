import 'package:flutter/material.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Text('Screen 6'),
            )));
  }
}
