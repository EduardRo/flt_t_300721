import 'package:flutter/painting.dart';

const kMainBackgroundImage = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage("state_example/cocktails.jpg"),
    fit: BoxFit.cover,
  ),
);

const kWhiteBackground = const BoxDecoration(
  color: Color(0xDDFFFFFF),
);
