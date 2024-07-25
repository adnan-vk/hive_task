import 'package:flutter/material.dart';
import 'package:hive01/add.dart';
import 'package:hive01/details.dart';
import 'package:hive01/model/function/function.dart';
import 'package:hive01/model/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    getVehicles();
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: vehiclelistNotifier,
        builder: (context, List<vehicleModel> vehicleList, child) {
          final veh = vehicleList;
          return ListView.builder(
            itemCount: veh.length,
            itemBuilder: (context, index) {
              final vehicle = veh[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisplayPage(
                        index: index,
                        name: vehicle.name.toString(),
                        phone: vehicle.phone.toString(),
                        number: vehicle.number.toString(),
                        model: vehicle.model.toString(),
                      ),
                    )),
                child: ListTile(
                  leading: const CircleAvatar(),
                  trailing: IconButton(
                    onPressed: () {
                      deleteVehicle(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  title: Text("${vehicle.name}"),
                  subtitle: Text("${vehicle.number}"),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
              ));
        },
        label: const Text("ADD DATA"),
      ),
    );
  }
}
