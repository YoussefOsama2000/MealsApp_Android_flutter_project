import 'package:flutter/material.dart';
import 'category_page.dart';
import 'meals_page.dart';
import 'meal_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromARGB(20, 51, 51, 1)),
              body2: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
            ),
      ),
      home: CategoryPage(),
      routes: {
        '/categories': (ctx) => CategoryPage(),
        '/meals': (ctx) => MealsPage(),
        MealDetails.routeName: (ctx) => MealDetails(),
      },
    );
  }
}
