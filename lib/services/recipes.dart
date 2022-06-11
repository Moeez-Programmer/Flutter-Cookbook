import 'dart:convert';
import 'package:http/http.dart';

Future<List> getRecipeList() async {
  List recipes = [];
  for (int i = 0; i < 10; i++) {
      Response response =  await get(Uri.parse("https://www.themealdb.com/api/json/v1/1/random.php"));
      Map recipe = jsonDecode(response.body)["meals"][0];
      if (recipe["strCategory"] != "Pork"){
        recipes.add(recipe);
      }
  }
  return recipes;
}
