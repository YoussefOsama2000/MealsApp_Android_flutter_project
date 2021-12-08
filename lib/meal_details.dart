import 'package:flutter/material.dart';
import 'meal_card.dart';
import 'models.dart';
import 'data.dart';

class MealDetails extends StatefulWidget {
  static String routeName = '/meal-details';
  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List;
    final String id = args[0];
    final Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MealCard(meal.title, meal.duration, meal.complexity,
                meal.affordability, meal.imageUrl, id, false),
            Text('details will be shown here',
                style: TextStyle(color: Colors.red, fontSize: 50)),
          ],
        ),
      ),
    );
  }
}
