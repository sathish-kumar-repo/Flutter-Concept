import 'dart:convert';

import 'package:api_fetch_pratice_products/product_card.dart';
import 'package:api_fetch_pratice_products/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    // you can replace your api link with this link
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['products'];
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
