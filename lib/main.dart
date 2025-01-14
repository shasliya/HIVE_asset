import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'AssetScreen.dart';
import 'Models/Assetmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final Box<AssetModel> assetBox = await Hive.openBox<AssetModel>('assets');


  Hive.registerAdapter(AssetModelAdapter()); // Register the adapter
  // Initialize Hive
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  Future<void> addAsset(AssetModel asset) async {
  final box = Hive.box<AssetModel>('assets');
  await box.add(asset);
  }
  List<AssetModel> getAllAssets() {
  final box = Hive.box<AssetModel>('assets');
  return box.values.toList();
  }
  Future<void> updateAsset(int index, AssetModel updatedAsset) async {
  final box = Hive.box<AssetModel>('assets');
  await box.putAt(index, updatedAsset);
  }
  Future<void> deleteAsset(int index) async {
  final box = Hive.box<AssetModel>('assets');
  await box.deleteAt(index);
  }

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
       home: AssetListScreen());
  }
}
