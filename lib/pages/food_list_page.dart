import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_detail.dart';

class FoodListPage extends StatefulWidget {
  final String category;

  const FoodListPage({Key? key, required this.category}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List _menuItems = [];
  List _menus = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/food_menu.json');
    final data = await json.decode(response);
    setState(() {
      _menuItems = data["categories"].firstWhere((cat) => cat["name"] == widget.category)["menu_ids"];
      _menus = data["menus"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _menuItems.isNotEmpty
          ? ListView.builder(
              itemCount: _menuItems.length,
              itemBuilder: (BuildContext context, int index) {
                var menuDetails = _menus.firstWhere((menu) => menu["id"] == _menuItems[index]);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodDetailPage(menuDetails: menuDetails),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.asset(menuDetails["img_path"], width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(menuDetails["name"]),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
