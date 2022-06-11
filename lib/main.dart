import 'package:cookbook/pages/loading.dart';
import 'package:flutter/material.dart';
import './pages/home.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/":(context) => const Loading(),
      "/home":(context) => const Home(),
    }
  ));
}
