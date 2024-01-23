import 'package:cart_with_providers/Checkout.dart';
import 'package:cart_with_providers/Item.dart';
import 'package:cart_with_providers/Model/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> items = [
    Item(Name: "S20 Ultra", Price: 520),
    Item(Name: "P30", Price: 500)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckPage()));
                  },
                  icon: Icon(Icons.shopping_cart)),
              Padding(
                padding: EdgeInsets.only(right: 4),
                child: Consumer<Cart>(builder: (context, Cart, child) {
                  return Text("${Cart.Total_price} £");
                }),
              )
            ],
          )
        ],
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, i) {
          return Card(
            child: Consumer<Cart>(
              builder: (context, Cart, child) {
                return ListTile(
                  title: Text("${items[i].Name}"),
                  subtitle: Text("${items[i].Price}"),
                  trailing: IconButton(
                      onPressed: () {
                        Cart.add(items[i]);
                      },
                      icon: Icon(Icons.add)),
                );
              },
            ),
          );
        },
        itemCount: items.length,
      )),
    );
  }
}
