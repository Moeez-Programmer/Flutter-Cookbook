import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/recipes.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getRecipeList().then((value) {
      Navigator.pushReplacementNamed(context, "/home", arguments: {'recipes': value});
    });
    return const Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SpinKitPouringHourGlass(
        color: Colors.white,
        size: 70.0,
      ),
    );
  }
}
