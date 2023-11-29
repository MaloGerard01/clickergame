import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';

///Utilisé par main_inherited_widget.dart
class PageTwo extends StatefulWidget {
  ///Plus besoin d'injecter d'état
  const PageTwo({super.key});

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  void _incrementCounter() {
    ///Mettre listen : false ici, sinon une erreur.
    ///It is unsupported because may pointlessly rebuild the widget associated to the
    ///event handler, when the widget tree doesn't care about the value.
    ///La raison c'est que ce widget est responsable de la mise à jour de l'état, il ne doit donc pas écouter. Par contre le widget Text plus bas est bien à l'écoute (par défaut : listen: true)
    var appState = Provider.of<MyAppState>(context, listen: false);
    appState.incrementWood();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        ///Remplace le bouton par défaut pour revenir en arrière
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Page Two'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have ${Provider.of<MyAppState>(context).woodCounter} wood',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
