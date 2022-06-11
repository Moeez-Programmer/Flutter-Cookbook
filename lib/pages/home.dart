import 'package:flutter/material.dart';
import './recipe.dart';
import '../services/recipes.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];

  bool _visibilty = false;
  List getIngredients(recipe) {
    List keys = recipe.keys.toList();
    List ingredients = [];
    for (int i = 0; i < keys.length; i++) {
      //strIngredients
      try {
        if (keys[i].substring(0, 13) == "strIngredient") {
          ingredients.add(keys[i]);
        }
      } catch (e) {}
    }
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? (ModalRoute.of(context)!.settings.arguments as Map)["recipes"]
        : data;
    return Scaffold(
      backgroundColor: Colors.orange[500],
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Recipe(
                              recipe: data[index],
                              ingredients: getIngredients(data[index])),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //strMeal strCategory strInstructions strMealThumb strIngredient(n)
                            AspectRatio(
                              aspectRatio: 2 / 1.1,
                              child: Image.network(
                                "${data[index]["strMealThumb"]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              data[index]["strMeal"].length > 100
                                  ? "${data[index]["strMeal"].substring(0, 100)}..."
                                  : "${data[index]["strMeal"]}",
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 17.0,
                                  letterSpacing: 1.0),
                            ),
                            Text(
                              "${data[index]["strCategory"]}",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 15.0,
                                  letterSpacing: 0.5),
                            )
                          ]),
                    ),
                  );
                }),
          ),
          _visibilty
              ? const SpinKitSpinningLines(
                  color: Colors.white,
                )
              : Container(),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _visibilty = true;
              });
              getRecipeList().then((value) {
                setState(() {
                  data = value;
                  _visibilty = false;
                });
              });
            },
            label: const Text(
              'Update Recipes',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16.0),
            ),
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
