import 'package:flutter/material.dart';
import 'package:auth_demo/modal/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final categories = [
    'Mobiles',
    'Fashion',
    'Electronics',
    'Grocery',
    'Appliances',
  ];

  final products = [
    Product(
      title: 'iPhone 15',
      image: 'https://via.placeholder.com/150',
      price: 79999,
      rating: 4.5,
    ),
    Product(
      title: 'Samsung Galaxy S23',
      image: 'https://via.placeholder.com/150',
      price: 69999,
      rating: 4.4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flipkart Clone')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Categories
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Chip(label: Text(categories[i])),
                ),
              ),
            ),

            // 🔹 Products
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (_, i) => ProductCard(product: products[i]),
            ),
          ],
        ),
      ),
    );
  }
}
