import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final Map<String, dynamic> menuDetails;

  const FoodDetailPage({Key? key, required this.menuDetails}) : super(key: key);

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    // Extract details from menuDetails
    String foodName = widget.menuDetails["name"];
    List ingredients = widget.menuDetails["ingredients"];
    List steps = widget.menuDetails["steps"];
    String imageUrl = widget.menuDetails["img_path"]; // Use the actual image path

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Detail'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Make the body scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                foodName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Ingredients:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...ingredients.map((ingredient) => Text(
                "${ingredient['name']}: ${ingredient['quantity']}",
                style: TextStyle(fontSize: 16),
              )).toList(),
              SizedBox(height: 8),
              Text(
                "Steps:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...steps.map((step) => Text(
                step,
                style: TextStyle(fontSize: 16),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
