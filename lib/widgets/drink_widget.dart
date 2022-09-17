import 'package:drinks/models/drink_model.dart';
import 'package:drinks/pages/drink_detail.dart';
import 'package:flutter/material.dart';

class DrinkWidget extends StatefulWidget {
  final DrinkDetails drink;

  const DrinkWidget({super.key, required this.drink});

  @override
  State<DrinkWidget> createState() => _DrinkWidgetState();
}

class _DrinkWidgetState extends State<DrinkWidget> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      child: ListTile(
        leading: Image.network(widget.drink.strDrinkThumb),
        title: Text(
          widget.drink.strDrink,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "#${widget.drink.idDrink}",
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.beach_access,
            color: (_checked == true) ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            _checked = true;
            setState(() {});
          },
        ),
        onLongPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DrinkDetail(drink: widget.drink)));
        },
      ),
    );
  }
}