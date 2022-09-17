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
  var list;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var futureDrinkDetails = fetchDrinkDetails();
    list = await futureDrinkDetails;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drinks 🍹", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (list != null && list.isNotEmpty)
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return DrinkWidget(
                    drink: list[index],
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}