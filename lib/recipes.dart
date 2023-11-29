import 'package:evalnatif/models/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'models/Item.dart';

class RecipesPage extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(1, 'Hache', 'Un outil utile', {'Bois': 2, 'Minerai de fer brut': 2}),
    Recipe(2, 'Recette 2', 'Description de la recette 2',
        {'Minerai de cuivre brut': 4}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recettes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index) {
          bool canProduce = true;
          recipes[index].cost.forEach((resource, cost) {
            if (getResourceQuantity(context, resource) < cost) {
              canProduce = false;
            }
          });
          return ListTile(
            title: Text(recipes[index].name),
            subtitle: Text(recipes[index].description),
            trailing: ElevatedButton(
              onPressed: canProduce ? () => produceItem(context, index) : null,
              child: Text('Produire'),
            ),
          );
        },
      ),
    );
  }

  int getResourceQuantity(BuildContext context, String resourceName) {
    var appState = Provider.of<MyAppState>(context, listen: false);

    for (var resource in appState.resources) {
      if (resource.name == resourceName) {
        return resource.quantity;
      }
    }
    return 0;
  }

  void produceItem(BuildContext context, int recipeIndex) {
    var appState = Provider.of<MyAppState>(context, listen: false);

    Recipe recipe = recipes[recipeIndex];
    Item item = Item(recipe.name, 1);
    appState.inventory.add(item);
  }
}
