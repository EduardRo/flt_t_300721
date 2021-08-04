import 'package:flutter/material.dart';
import 'package:flt_t_300721/state_example/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData.light().copyWith(primaryColor: Colors.redAccent),
      home: CheckBoxScreen(),
    );
  }
}

class CheckBoxScreen extends StatelessWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cocktail Orders:'),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: kWhiteBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Drinks Tonight',
                    style: Theme.of(context).textTheme.headline4),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                    Text(
                      'Water',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                Text(
                  'The order is: ',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text('water'),
                    ),
                    itemCount: 0,
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
