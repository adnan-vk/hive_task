import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive01/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<vehicleModel>> vehiclelistNotifier = ValueNotifier([]);

addVehicle(value) async {
  final vehicle_db = await Hive.openBox<vehicleModel>('vehicle_db');
  await vehicle_db.add(value);
  vehiclelistNotifier.value.add(value);
  log("vehicle added");
  vehiclelistNotifier.notifyListeners();
}

getVehicles() async {
  final vehicle_db = await Hive.openBox<vehicleModel>('vehicle_db');
  vehiclelistNotifier.value.clear();
  vehiclelistNotifier.value.addAll(vehicle_db.values);
  vehiclelistNotifier.notifyListeners();
}

deleteVehicle(index) async {
  final vehicle_db = await Hive.openBox<vehicleModel>('vehicle_db');
  vehicle_db.deleteAt(index);
  getVehicles();
}
