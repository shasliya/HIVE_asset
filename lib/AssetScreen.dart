import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'AddassetScreen.dart';
import 'EditAssetScreen.dart';
import 'Models/Assetmodel.dart';

class AssetListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assets")),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<AssetModel>('assets').listenable(),
        builder: (context, Box<AssetModel> box, _) {
          if (box.isEmpty) {
            return Center(child: Text("No assets found."));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final asset = box.getAt(index);
              return ListTile(
                title: Text(asset!.name),
                subtitle: Text("Type: ${asset.assetType}"),
                trailing: Icon(
                  asset.isAvailable ? Icons.check_circle : Icons.block,
                  color: asset.isAvailable ? Colors.green : Colors.red,
                ),
                onTap: () {

                    // Navigate to edit screen with the selected asset
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAssetScreen(asset: asset),
                      ),
                    );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAssetScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
