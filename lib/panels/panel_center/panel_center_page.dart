import 'package:flutter/material.dart';

import '../../constants.dart';
import 'linear_graph.dart';

class PanelCenterPage extends StatefulWidget {
  const PanelCenterPage({Key? key}) : super(key: key);

  @override
  _PanelCenterPageState createState() => _PanelCenterPageState();
}

class Person {
  String name;
  Color color;

  Person({
    required this.name,
    required this.color,
  });
}

class _PanelCenterPageState extends State<PanelCenterPage> {
  final List<Person> _persons = [
    Person(name: "Ranjan Yadav", color: Constants.orangeDark),
    // Person(name: "Samiksha Bhandari Yadav", color: Constants.orangeDark),
    // Person(name: "Anjali Mishra", color: Constants.redDark),
    Person(name: "Anand Shah", color: Constants.redLight),
    Person(name: "Dipak Kandel", color: Constants.blueLight),
    Person(name: "Anjali Kandel", color: Constants.greenLight),
    Person(name: "Rahul Jaiswal", color: Constants.redLight),
    Person(name: "Alpha Beta Ray", color: Constants.redDark),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    title: Text(
                      "Products Available",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "83% of the Products",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        "\$20,500",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Chart in the Middle
            const BarChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    children: List.generate(
                  _persons.length,
                  (index) => ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      child: Text(
                        _persons[index].name.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: _persons[index].color,
                    ),
                    title: Text(
                      _persons[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.message_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
