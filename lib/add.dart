import 'package:flutter/material.dart';
import 'package:hive01/model/function/function.dart';
import 'package:hive01/model/model.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<vehicleModel> vehicleList;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.length != 10) {
                  return "Enter correct number";
                }
              },
              controller: phoneController,
              decoration: const InputDecoration(
                label: Text("phone Number"),
              ),
            ),
            TextFormField(
              controller: modelController,
              decoration: const InputDecoration(label: Text("Model")),
            ),
            TextFormField(
              controller: numberController,
              decoration: const InputDecoration(label: Text("Vehicle Number")),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  addVehicles(context);
                }
              },
              child: const Text("ADD VEHICLE"),
            )
          ],
        ),
      ),
    );
  }

  addVehicles(context) {
    final name = nameController.text;
    final phone = int.parse(phoneController.text);
    final model = modelController.text;
    final number = numberController.text;
    final vehicles =
        vehicleModel(model: model, name: name, number: number, phone: phone);
    addVehicle(vehicles);
    nameController.clear();
    phoneController.clear();
    modelController.clear();
    numberController.clear();
    Navigator.pop(context);
  }
}
