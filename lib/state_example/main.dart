import 'package:flutter/material.dart';
import 'package:flt_t_300721/state_example/constants.dart';

class Drink {
  String name;
  bool selected;

  Drink({required this.name, required this.selected});
}

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

class CheckBoxScreen extends StatefulWidget {
  @override
  _CheckBoxScreenState createState() => _CheckBoxScreenState();
}

// State of the widget
class _CheckBoxScreenState extends State<CheckBoxScreen> {
  List<Drink> drinks = [
    Drink(name: 'Water', selected: false),
    Drink(name: 'Cuba Libre', selected: false),
    Drink(name: 'Pina Colada', selected: true),
    Drink(name: 'Havana Club', selected: false)
  ];
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
                ...drinks
                    .map(
                      (drink) => DrinksWidget(drinkName: drink.name),
                    )
                    .toList(),
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

class DrinksWidget extends StatefulWidget {
  final String drinkName;

  const DrinksWidget({Key? key, required this.drinkName}) : super(key: key);
  @override
  _DrinksWidgetState createState() => _DrinksWidgetState();
}

class _DrinksWidgetState extends State<DrinksWidget> {
  bool waterCheckboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: waterCheckboxValue,
          onChanged: (value) {
            waterCheckboxValue = !waterCheckboxValue;
            setState(() {});
            print('$waterCheckboxValue, ${widget.drinkName}');
          },
        ),
        Text(widget.drinkName),
      ],
    );
  }
}
