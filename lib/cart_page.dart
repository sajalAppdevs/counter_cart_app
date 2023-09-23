import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({required this.totalPurchasedCount});
  final int totalPurchasedCount;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Total Product Purchased: ${widget.totalPurchasedCount}",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
