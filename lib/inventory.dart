import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventaire'),
      ),
      body: ListView.builder(
        itemCount: Provider.of<MyAppState>(context).inventory.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(Provider.of<MyAppState>(context).inventory[index].name),
            subtitle: Text(
                'Quantité: ${Provider.of<MyAppState>(context).inventory[index].quantity}'),
          );
        },
      ),
    );
  }
}
