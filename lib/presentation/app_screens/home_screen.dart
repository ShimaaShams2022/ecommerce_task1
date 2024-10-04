import 'package:ecommerce_task1/presentation/app_widgets/one_product_widget.dart';
import 'package:flutter/material.dart';

import '../app_theme/app_theme_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  List<String> productsList=[
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products",
          style: AppThemeData.lightTheme.textTheme.titleLarge,),),
      body:  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: .8,
      ),
        itemCount:productsList.length,
        itemBuilder: (context,index){
          return OneProductWidget();
        },
      ),
    );
  }
}
