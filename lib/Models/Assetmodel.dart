import 'package:hive/hive.dart';
part 'Assetmodel.g.dart';


@HiveType(typeId: 0)
class AssetModel {
  @HiveField(0)
  String assetType;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  String serialNumber;

  @HiveField(4)
  bool isAvailable;

  AssetModel({
    required this.assetType,
    required this.name,
    required this.description,
    required this.serialNumber,
    required this.isAvailable,
  });
}
