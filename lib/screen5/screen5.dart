import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.primaries[1],
        body: SafeArea(
            bottom: false,
            child: Center(
              child: Text('Screen 5'),
            )));
  }
}
