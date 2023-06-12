// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class worldtime
{
  String time="";
  String location;
  String flag;
  String url;
  bool isdaytime=false;

  worldtime({required this.location,required this.flag,required this.url});

Future<void> getData() async{
    
   Response response= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
   Map data=jsonDecode(response.body);
  //  print(data);

  //To the properties
  String datetime = data['utc_datetime'];
  String offset=data['utc_offset'].substring(0,3);
  // print(offset);


  // print(datetime);

  DateTime now= DateTime.parse(datetime);
  now=now.add(Duration(hours: int.parse(offset)));
  isdaytime=(now.hour>6 && now.hour<18);

  time=DateFormat.jm().format(now);


  // print(now);



 


  }

}
