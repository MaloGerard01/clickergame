import 'package:evalnatif/inventory.dart';
import 'package:evalnatif/models/Resource.dart';
import 'package:evalnatif/recipes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Item.dart';
import 'models/Effect.dart';

void main() {
  runApp(MyApp());
}

class MyAppState extends ChangeNotifier {
  List<Resource> resources = [
    Resource('Bois', 0, Color(0xFF967969), true),
    Resource('Minerai de fer brut', 999, Color(0xFFced4da), true),
    Resource('Minerai de cuivre brut', 999, Color(0xFFd9480f), true),
    Resource('Charbon', 0, Colors.black45, false),
  ];

  List<Item> inventory = [];

  void increment(index) {
    resources[index].quantity++;
    notifyListeners();
  }

  void cost(index, quant) {
    resources[index].quantity--;
    // resources[index].quantity = resources[index].quantity - quant;

    notifyListeners();
  }

  void checkRequirements() {
    if (resources[1].quantity >= 1000 && resources[2].quantity >= 1000) {
      resources[3].requirementMet = true;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          title: 'Click game',
          initialRoute: '/',
          routes: {
            '/': (context) => ResourcesPage(),
            '/recipes': (context) => RecipesPage(),
            '/inventory': (context) => InventoryPage(),
          },
        ));
  }
}

class ResourcesPage extends StatefulWidget {
  @override
  _ResourcesPageState createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ressources'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context, '/recipes');
            },
          ),
          IconButton(
            icon: Icon(Icons.inventory),
            onPressed: () {
              Navigator.pushNamed(context, '/inventory');
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: Provider.of<MyAppState>(context).resources.length,
        itemBuilder: (BuildContext context, int index) {
          if (Provider.of<MyAppState>(context)
                  .resources[index]
                  .requirementMet ==
              true) {
            return GestureDetector(
              onTap: () {
                Provider.of<MyAppState>(context, listen: false)
                    .checkRequirements();
                Provider.of<MyAppState>(context, listen: false)
                    .increment(index);
              },
              child: Container(
                margin: EdgeInsets.all(8),
                color: Provider.of<MyAppState>(context).resources[index].color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Provider.of<MyAppState>(context).resources[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        'Quantité: ${Provider.of<MyAppState>(context).resources[index].quantity}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
