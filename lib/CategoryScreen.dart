import 'package:flutter/material.dart';
import 'package:mca/ProductDetailScreen.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryName;

  CategoryScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3E8876),
        title: Text(categoryName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => productItem(context),
      ),
    );
    }
  }

  // Product Item Widget
  Widget productItem(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
        productName: "Old Mans",
        imageUrl: "sample_product.jpg",
        artistName: "Darshan Raval",
        price: 25,
        oldPrice: 50,
        description:
            "In a sunlit corner of a cluttered attic, an old man sits with delicate brushes and a palette of memories...",
        category: "Water Color",
        extra: "Black Wood Frame",
        deliveryDetails: "Home Delivery Available, Advance Deposit 30%",
          ),
        ),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset('sample_product.jpg', fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Old Mans", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("\$25", style: TextStyle(fontSize: 14, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
