import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final String artistName;
  final double price;
  final double oldPrice;
  final String description;
  final String category;
  final String extra;
  final String deliveryDetails;

  ProductDetailScreen({
    required this.productName,
    required this.imageUrl,
    required this.artistName,
    required this.price,
    required this.oldPrice,
    required this.description,
    required this.category,
    required this.extra,
    required this.deliveryDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF3E8876),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.share, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name & Price
                  Text(productName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("\$$price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                      SizedBox(width: 10),
                      Text("\$$oldPrice", style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                      SizedBox(width: 5),
                      Text("50% off", style: TextStyle(fontSize: 16, color: Colors.red)),
                    ],
                  ),
                  SizedBox(height: 15),

                  // Artist Info
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(artistName[0], style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(width: 10),
                      Text(artistName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: Text("Follow", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Product Description
                  Text(description, style: TextStyle(fontSize: 14, color: Colors.grey)),
                  SizedBox(height: 20),

                  // Add to Cart Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3E8876),
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      child: Text("Add To Cart", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Additional Details
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price Type", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text("Fixed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Category", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text(category, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Artist", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text(artistName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text("Extra", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                          Text(extra, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Delivery Details
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Additional Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Details", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                              Expanded(
                                child: Text(deliveryDetails, textAlign: TextAlign.end, style: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        ],
                      ),
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
