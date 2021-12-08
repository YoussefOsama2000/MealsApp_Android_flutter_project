import 'package:flutter/material.dart';
import 'data.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Categories',
        ),
      ),
      body: GridView(
          children: DUMMY_CATEGORIES
              .map((item) => InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.pushNamed(context, '/meals',
                          arguments: [item.id, item.title, item.color]);
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          item.title ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomRight,
                              colors: [
                                item.color,
                                item.color.withOpacity(0.6),
                              ]),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ))
              .toList(),
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
