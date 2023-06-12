import 'package:flutter/material.dart';
import 'world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<worldtime> locations = [
    worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    worldtime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    worldtime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),

    worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updatetime(index) async{
    worldtime instance=locations[index];
    await instance.getData();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isdaytime':instance.isdaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build function");
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text("Choose Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(

              padding: const EdgeInsets.all(2.0),
              child: Card(
                child: ListTile(onTap: () {
                  updatetime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                ),
              ),
            );
          },
        ));
  }
}
