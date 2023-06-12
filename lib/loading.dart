// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:worldtime/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setuptime() async {
    worldtime instance = worldtime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/berlin');
    await instance.getData();
    // print(instance.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isdaytime':instance.isdaytime,
    });
 
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setuptime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Center(
          child: SpinKitWave(
  color: Colors.white,
  size: 50.0,
),

        ),
      )
    );
  }
}
