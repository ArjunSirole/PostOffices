import 'package:flutter/material.dart';

import 'PincodeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pincode Adress',
      home: const Scaffold(body: PincodeScreen(),),
      theme: ThemeData(brightness:Brightness.dark,primarySwatch: Colors.orange),
          //brightness:Brightness.dark,primaryColor: Colors.orange),
    );
  }
}

