import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  final Map recipe;
  final List ingredients;
  const Recipe({Key? key, required this.recipe, required this.ingredients})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: AppBar(
          title: const Text("Recipe"),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //strMeal strCategory strInstructions strMealThumb strIngredient(n)
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Image.network(
                  recipe["strMealThumb"],
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "${recipe["strMeal"]}",
                style: TextStyle(color: Colors.grey[900], fontSize: 24.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Ingredients: ",
                style: TextStyle(color: Colors.grey[900], fontSize: 23.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              for (int i = 0; i < ingredients.length; i++) recipe[ingredients[i]].length == 0 ? Container() : Text(
                        "\u2022 ${recipe[ingredients[i]]}",
                        style: TextStyle(color: Colors.grey[800], fontSize: 16),
                      ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Instructions: ",
                style: TextStyle(color: Colors.grey[900], fontSize: 23.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                recipe["strInstructions"],
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 17,
                    letterSpacing: .5,
                    wordSpacing: 1,
                    height: 1.5),
              )
            ],
          ),
        ));
  }
}
