import 'package:flutter/material.dart';
import 'package:meals/data.dart';
import 'meal_card.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as List;
    final String id = routeArgs[0] ?? '';
    final String title = routeArgs[1] ?? '';
    final Color color = routeArgs[2] ?? Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: DUMMY_MEALS.where((element) {
            return element.categories!.contains(id);
          }).map((e) {
            return MealCard(e.title, e.duration, e.complexity, e.affordability,
                e.imageUrl, e.id, true);
          }).toList(),
        )),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomRight,
              colors: [color, Colors.white]),
        ),
      ),
    );
  }
}
