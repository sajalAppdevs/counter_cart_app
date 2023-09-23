import 'package:counter_cart_app/cart_page.dart';
import 'package:flutter/material.dart';

class CounterHome extends StatefulWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  State<CounterHome> createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  Map<String, String> product = {
    "Dragonfruit": '৳27',
    "Grapefruit": "৳200",
    "JackFruits": '৳152',
    "Apple": '৳62',
    "Banana": '৳372',
    "Orange": '৳372',
  };

  Map<String, int> buyCounters = {};
  int totalPurchasedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: product.length,
        itemBuilder: ((context, index) {
          final productName = product.keys.elementAt(index);
          final productPrice = product[productName];
          return Container(
            child: ListTile(
              leading: Icon(
                Icons.circle,
                size: 20,
              ),
              title: Text(
                productName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('Price: $productPrice',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
              trailing: Column(
                children: [
                  Container(
                    height: 15,
                    child: Text(
                      'Count: ${buyCounters[productName] ?? 0}', // Display the click count for the specific product
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buyCounters[productName] = (buyCounters[
                                      productName] ??
                                  0) +
                              1; // Increment the click counter for the specific product
                        });

                        if (buyCounters[productName] == 5) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title:
                                    Text('Congress you purchased $productName'),
                                content: Text(
                                    'You clicked Buy 5 times for $productName.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        if (buyCounters[productName] == 1) {
                          totalPurchasedCount++;
                        }
                      },
                      child: Text('Buy'),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Purchased: $totalPurchasedCount',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10), // Add spacing between the text and button
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          CartPage(totalPurchasedCount: totalPurchasedCount)));
            },
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
