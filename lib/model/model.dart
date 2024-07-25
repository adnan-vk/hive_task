import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class vehicleModel {
  @HiveField(0)
  String? name;
  int? phone;
  String? model;
  String? number;
  vehicleModel({this.name, this.number, this.phone, this.model});
}
