import 'package:drinks/models/drink_model.dart';
import 'package:drinks/widgets/drink_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<List<DrinkDetails>> futureDrinkDetails;
  var nonAlcoholicDrinksList;
  var alcoholicDrinksList;
  var _widgetOptions;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var futureNADrinkDetails = fetchNADrinkDetails();
    var futureADrinkDetails = fetchADrinkDetails();
    nonAlcoholicDrinksList = await futureNADrinkDetails;
    alcoholicDrinksList = await futureADrinkDetails;
    var options = <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: (nonAlcoholicDrinksList != null &&
                nonAlcoholicDrinksList.isNotEmpty)
            ? ListView.builder(
                itemCount: nonAlcoholicDrinksList.length,
                itemBuilder: (context, index) {
                  return DrinkWidget(
                    drink: nonAlcoholicDrinksList[index],
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: (alcoholicDrinksList != null && alcoholicDrinksList.isNotEmpty)
            ? ListView.builder(
                itemCount: alcoholicDrinksList.length,
                itemBuilder: (context, index) {
                  return DrinkWidget(
                    drink: alcoholicDrinksList[index],
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    ];

    _widgetOptions = options;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Drinks 🍹", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: (_widgetOptions != null && _widgetOptions.isNotEmpty)
                ? _widgetOptions.elementAt(_selectedIndex)
                : (const CircularProgressIndicator())),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.no_drinks_sharp,
                color: Colors.white,
              ),
              label: "n alc",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wine_bar,
                color: Colors.white,
              ),
              label: "alc",
            ),
          ],
        ));
  }
}