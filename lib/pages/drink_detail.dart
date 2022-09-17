import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final drink;

  const DrinkDetail({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white,
        Colors.orange,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(drink.strDrink, style: const TextStyle(color: Colors.white)),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: drink.idDrink,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                    drink.strDrinkThumb,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "ID: ${drink.idDrink}",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                "${drink.strDrink}",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}