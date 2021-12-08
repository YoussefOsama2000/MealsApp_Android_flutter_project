import 'package:flutter/material.dart';
import 'package:meals/models.dart';
import 'data.dart';
import 'meal_details.dart';

class MealCard extends StatelessWidget {
  final String? title;
  final int? duration;
  final Complexity? complexity;
  final Affordability? affordability;
  final String? url;
  final String? id;
  final bool? tap;
  const MealCard(this.title, this.duration, this.complexity, this.affordability,
      this.url, this.id, this.tap);

  @override
  Widget build(BuildContext context) {
    selectMeal() {
      if (tap == true) {
        Navigator.pushNamed(context, MealDetails.routeName, arguments: [id]);
      }
    }

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.white60,
      onTap: selectMeal,
      child: Card(
        color: Colors.black,
        elevation: 6,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                title ?? '',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white60,
                    fontWeight: FontWeight.w300,
                    fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                url!,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.schedule,
                    color: Colors.white60,
                  ),
                  Text(
                    '$duration min',
                    style: TextStyle(color: Colors.white60, fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      width: 10,
                      color: Colors.white60,
                      thickness: 1,
                    ),
                  ),
                  Icon(
                    Icons.work,
                    color: Colors.white60,
                  ),
                  Text(
                    complexity == Complexity.Simple
                        ? 'simple'
                        : (complexity == Complexity.Challenging
                            ? 'challenging'
                            : 'Hard'),
                    style: TextStyle(color: Colors.white60, fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      width: 10,
                      color: Colors.white60,
                      thickness: 1,
                    ),
                  ),
                  Icon(
                    Icons.attach_money,
                    color: Colors.white60,
                  ),
                  Text(
                    affordability == Affordability.Affordable
                        ? 'affordable'
                        : (affordability == Affordability.Pricey
                            ? 'pricey'
                            : 'Luxurious'),
                    style: TextStyle(color: Colors.white60, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
