import 'dart:async';

import 'package:flutter/material.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamed(context, 'home');
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/News.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
