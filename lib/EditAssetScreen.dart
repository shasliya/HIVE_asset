import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Models/Assetmodel.dart';

class EditAssetScreen extends StatefulWidget {
  final AssetModel asset;

  EditAssetScreen({required this.asset});

  @override
  _EditAssetScreenState createState() => _EditAssetScreenState();
}

class _EditAssetScreenState extends State<EditAssetScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController serialController = TextEditingController();
  bool isAvailable = true;

  @override
  void initState() {
    super.initState();
    // Pre-populate the fields with the current asset data
    nameController.text = widget.asset.name;
    typeController.text = widget.asset.assetType;
    descriptionController.text = widget.asset.description;
    serialController.text = widget.asset.serialNumber;
    isAvailable = widget.asset.isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Asset")),
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
                    setState(() {
                      isAvailable = value;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final updatedAsset = AssetModel(
                  assetType: typeController.text,
                  name: nameController.text,
                  description: descriptionController.text,
                  serialNumber: serialController.text,
                  isAvailable: isAvailable,
                );

                final box = Hive.box<AssetModel>('assets');
                final index = box.values.toList().indexOf(widget.asset);

                // Update the asset in Hive
                box.putAt(index, updatedAsset);

                // Return to the previous screen
                Navigator.pop(context);
              },
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
