import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments as Map;

    

    print(data);

    String bgimage=data['isdaytime']?'dayimage.jpg':'nightimage.jpg';
    Color bgcolor=data['isdaytime']?Colors.blue:Colors.indigo;
    Color strcolor=data['isdaytime']?Colors.black:Colors.white;
    



    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/$bgimage'),
            fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                   dynamic result=await Navigator.pushNamed(context, '/location');
                   setState(() {

                    data={
                      'time':result['time'],
                      'location':result['location'],
                      'flag':result['flag'],
                      'isdaytime':result['isdaytime'],

                    };
                   
                   });
                  },
                  icon: Icon(Icons.edit_location,color: Colors.black,),
                  label: Text('Edit Location',style: TextStyle(
                    color: strcolor,
                  ),),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28, letterSpacing: 2,color: strcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: strcolor
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
