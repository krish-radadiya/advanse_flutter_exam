import 'package:advansed_flutter_exam/modules/screens/splashscreen/views/splashscreen.dart';
import 'package:flutter/material.dart';

import 'modules/screens/homescreen/views/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const splashscreen(),
        'home': (context) => const Homescreen(),
      },
    ),
  );
}
