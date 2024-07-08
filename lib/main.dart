import 'package:flutter/material.dart';
// import 'components/category.dart';
import 'pages/food_list_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 239, 182, 96)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Khao khua'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToFoodList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodListPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  Card.filled(
                    child: _SampleCard(
                      cardName: 'ອາຫານເພື່ອສຸຂະພາບ',
                      backgroundImage: AssetImage('assets/images/image1.jpg'),
                      onTap: () => _navigateToFoodList(context, 'ອາຫານເພື່ອສຸຂະພາບ'),
                    ),
                  ),
                  Card.filled(
                    child: _SampleCard(
                      cardName: 'ຂະໜົມຫວານ',
                      backgroundImage: AssetImage('assets/images/image2.jpg'),
                      onTap: () => _navigateToFoodList(context, 'ຂະໜົມຫວານ'),
                    ),
                  ),
                  Card.filled(
                    child: _SampleCard(
                      cardName: 'ອາຫານເຊົ້າ',
                      backgroundImage: AssetImage('assets/images/image3.jpg'),
                      onTap: () => _navigateToFoodList(context, 'ອາຫານເຊົ້າ'),
                    ),
                  ),
                  Card.filled(
                    child: _SampleCard(
                      cardName: 'ອາຫານຈານດ່ຽວ',
                      backgroundImage: AssetImage('assets/images/image4.jpg'),
                      onTap: () => _navigateToFoodList(context, 'ອາຫານຈານດ່ຽວ'),
                    ),
                  ),
                  Card.filled(
                    child: _SampleCard(
                      cardName: 'ປະເພດແກງ',
                      backgroundImage: AssetImage('assets/images/image5.jpg'),
                      onTap: () => _navigateToFoodList(context, 'ປະເພດແກງ'),
                    ),
                  ),
                  Card.filled(
                    child: _SampleCard(
                      cardName: 'ອາຫານຄໍ່າ',
                      onTap: () => _navigateToFoodList(context, 'ອາຫານຄໍ່າ'),
                      backgroundImage: AssetImage('assets/images/image2.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _SampleCard extends StatelessWidget {
  final String cardName;
  final ImageProvider<Object> backgroundImage;
  final VoidCallback onTap;

  const _SampleCard({
    required this.cardName,
    required this.backgroundImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              image: backgroundImage,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: onTap,
                child: Container(),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.6 ), // Adjust opacity as needed
              ),
            ),
            Positioned(
              bottom: 8.0,
              left: 8.0,
              right: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cardName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class _SampleCard extends StatelessWidget {
//   const _SampleCard({required this.cardName, required this.onTap});
//   final String cardName;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: SizedBox(
//         width: 156,
//         height: 156,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 cardName,
//                 style: const TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
