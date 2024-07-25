// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class vehicleModelAdapter extends TypeAdapter<vehicleModel> {
  @override
  final int typeId = 1;

  @override
  vehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return vehicleModel(
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, vehicleModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is vehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
