import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  //
  // const ProductDetailScreen(this.title, {super.key});
  static const routeName = 'product-detail';

  @override
  Widget build(BuildContext context) {
    final  productId = ModalRoute.of(context)?.settings.arguments;
  final loadedProduct=  Provider.of<Products>(context,listen: false).findById(productId.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}