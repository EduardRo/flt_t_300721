import 'package:flutter/material.dart';
import 'package:flt_t_300721/location_prog/pages/choose_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('this is the app bar'),
        ),
        body: Location(),
      ),
    );
  }
}
