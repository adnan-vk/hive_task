import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final int index;
  final String name;
  final String phone;
  final String model;
  final String number;
  const DisplayPage(
      {super.key,
      required this.index,
      required this.name,
      required this.phone,
      required this.number,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(name),
          Text(phone),
          Text(model),
          Text(number),
        ],
      ),
    );
  }
}
