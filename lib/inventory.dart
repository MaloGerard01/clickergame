import 'package:evalnatif/models/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class InventoryPage extends StatelessWidget {
  var appState = Provider.of<MyAppState>(context, listen: false);

  final List<Item> items = [
    Item('Item 1', 10),
    Item('Item 2', 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaire'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text('Quantité: ${items[index].quantity}'),
          );
        },
      ),
    );
  }
}
