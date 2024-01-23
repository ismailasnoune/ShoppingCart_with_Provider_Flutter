import 'package:cart_with_providers/Model/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({super.key});

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
          actions: [
            Row(
              children: [
                Text("Total Price:   "),
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
        body: Consumer<Cart>(
          builder: (context, Cart, child) {
            return ListView.builder(
              itemCount: Cart.basketitem.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      title: Text("${Cart.basketitem[index].Name}"),
                      trailing: ElevatedButton.icon(
                          onPressed: () {
                            Cart.remove(Cart.basketitem[index]);
                          },
                          icon: Icon(Icons.remove),
                          label: Text(""))),
                );
              },
            );
          },
        ));
  }
}
