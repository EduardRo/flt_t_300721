import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  List<NewWorldTime> newlocations = [
    NewWorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    NewWorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    NewWorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    NewWorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    NewWorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    NewWorldTime(
        url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    NewWorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    NewWorldTime(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(locations[index].location),
                ),
              );
            },
          ),
          ListView.builder(
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: newlocations.length,
              itemBuilder: (context, idx) {
                return Text(newlocations[idx].location);
              }),
        ],
      ),
    );

    /* return Scaffold(
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {},
              title: Text(locations[index].location),
            ),
          );
        },
      ),
    ); */
  }
}

class WorldTime {
  String location; // location name for UI
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({
    required this.url,
    required this.location,
    required this.flag,
  });
}

class NewWorldTime {
  String location; // location name for UI
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  NewWorldTime({
    required this.url,
    required this.location,
    required this.flag,
  });
}
