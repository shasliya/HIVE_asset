import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'Models/Assetmodel.dart';

class AddAssetScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController serialController = TextEditingController();
  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Asset")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: typeController,
              decoration: InputDecoration(labelText: "Asset Type"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Asset Name"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: serialController,
              decoration: InputDecoration(labelText: "Serial Number"),
            ),
            Row(
              children: [
                Text("Available:"),
                Switch(
                  value: isAvailable,
                  onChanged: (value) {
                    isAvailable = value;
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final newAsset = AssetModel(
                  assetType: typeController.text,
                  name: nameController.text,
                  description: descriptionController.text,
                  serialNumber: serialController.text,
                  isAvailable: isAvailable,
                );

                Hive.box<AssetModel>('assets').add(newAsset);
                Navigator.pop(context);
              },
              child: Text("Add Asset"),
            ),
          ],
        ),
      ),
    );
  }
}
