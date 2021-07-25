import 'package:carrinho_de_compras/modules/cart/cart_controller.dart';
import 'package:carrinho_de_compras/shared/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CartPage extends StatefulWidget {
  final CartController controller;
  CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (_) {
          if (widget.controller.list.isEmpty) {
            return Center(child: Text("OPS! Seu carrinho está vazio"));
          } else {
            return ListView.builder(
              itemCount: widget.controller.list.length,
              itemBuilder: (_, index) => GestureDetector(
                child: ListTile(
                  title: Text(widget.controller.list[index].name),
                  trailing: Text(
                    (widget.controller.list[index].price as double).reais(),
                  ),
                  subtitle: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.controller
                              .addItem(widget.controller.list[index]);
                        },
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.controller
                              .removeItem(widget.controller.list[index]);
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  // widget.controller.removeItem(widget.controller.list[index]);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
