// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Assetmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetModelAdapter extends TypeAdapter<AssetModel> {
  @override
  final int typeId = 0;

  @override
  AssetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssetModel(
      assetType: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      serialNumber: fields[3] as String,
      isAvailable: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AssetModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.assetType)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.serialNumber)
      ..writeByte(4)
      ..write(obj.isAvailable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
