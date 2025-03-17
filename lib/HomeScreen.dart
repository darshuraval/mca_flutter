import 'package:flutter/material.dart';
import 'package:mca/CategoryScreen.dart';
import 'package:mca/ProductDetailScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF3E8876),
        title: Text('Arts', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search Product',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('banner.jpg', fit: BoxFit.cover, width: double.infinity, height: 150),
                    Container(
                      color: Colors.black.withOpacity(0.4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("READY TO DELIVER TO YOUR HOME", style: TextStyle(color: Colors.white, fontSize: 16)),
                          ElevatedButton(onPressed: () {}, child: Text("START SHOPPING"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              child: Row(
                children: List.generate(8, (index) => categoryItem(context, 'Category ${index + 1}')),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("New Product", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text("See All"))
                ],
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
              itemCount: 4,
              itemBuilder: (context, index) => productItem(context),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Browse"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Order History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
  
  }

  Widget categoryItem(BuildContext context, String categoryName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen(categoryName: categoryName)),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage('sample.jpg'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 5),
            Text(categoryName, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

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
