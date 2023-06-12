import 'package:flutter/material.dart';
import 'package:worldtime/choose_location.dart';
import 'package:worldtime/loading.dart';
import 'home.dart';

void main() {
  runApp( MaterialApp(
    initialRoute: '/home',
    // home:Home(),
    routes: {
      // '/':(context) => Loading(),
      '/home':(context) => Home(),
      "/location":(context) => ChooseLocation(),
    },
    debugShowCheckedModeBanner: false,
  ));
}

