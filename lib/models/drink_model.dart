import 'dart:convert';
import 'package:http/http.dart' as http;

/*
  var api1 = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var api2 = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic";
  var api3 = "www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic";
*/

List<DrinkDetails> parseDrinks(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<String, dynamic>()['drinks'];

  return parsed.map<DrinkDetails>((json) => DrinkDetails.fromJson(json)).toList();
}

Future<List<DrinkDetails>> fetchNADrinkDetails() async {
  final nonAlcoholicURI = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic');
  final nonAlcoholicResponse = await http.get(nonAlcoholicURI);

  return parseDrinks(nonAlcoholicResponse.body);
}

Future<List<DrinkDetails>> fetchADrinkDetails() async {
  final alcoholicURI = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic');
  final alcoholicResponse = await http.get(alcoholicURI);
  return parseDrinks(alcoholicResponse.body);
}

class DrinkDetails {
  late String idDrink;
  late String strDrink;
  late String strDrinkThumb;

  DrinkDetails({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkThumb,
  });

  factory DrinkDetails.fromJson(Map<String, dynamic> json) {
    return DrinkDetails(
      idDrink: json['idDrink'],
      strDrink: json['strDrink'],
      strDrinkThumb: json['strDrinkThumb'],
    );
  }
}
