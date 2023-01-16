import 'package:my_awesome_namer_app/pages/my_favorites_page.dart';
import 'package:provider/provider.dart';
import '../statemanager/my_app_state.dart';
import 'package:flutter/material.dart';
import '../widgets/BigCard.dart';

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => 
  _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = MyFavoritesPages();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  // ignore: prefer_const_literals_to_create_immutables
                  destinations: [
                    const NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    const NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value){
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),    
        );
      }
    );
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    
    IconData icon;
    if(appState.favorites.contains(pair)){
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }



    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair), 
            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  }, 
                  icon: Icon(icon), 
                  label: const Text ('Like'),
                  ),
                  const SizedBox(width: 10,),

                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: const Text('Next'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

