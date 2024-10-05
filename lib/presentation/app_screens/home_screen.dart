import 'package:ecommerce_task1/presentation/app_widgets/one_product_widget.dart';
import 'package:ecommerce_task1/presentation/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../app_theme/app_theme_data.dart';
import '../app_widgets/ErrorStateWidget.dart';
import '../app_widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//field injection
var productViewModel = getIt.get<ProductViewModel>();

class _HomeScreenState extends State<HomeScreen> {
  List<String> myList = [

    "product.jpg",
    "product.jpg",
    "product.jpg",
    "product.jpg"
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel.loadProductHomeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => productViewModel,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Products",
                  style: AppThemeData.lightTheme.textTheme.titleLarge,
                ),
              ),
             centerTitle: true,

            ),
          ),
          body: BlocBuilder<ProductViewModel, ProductHomeState>(
              builder: (context, state) {
            switch (state) {
              case ProductLoadingState():
                return LoadingStateWidget();
              case ProductSuccessState():
                {
                  var productsList =
                      (state).productResults??[];
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: productsList.length,
                    itemBuilder: (context, index) {
                      return OneProductWidget(product:productsList[index],);
                    },
                  );
                }
              case ProductErrorState():
                return ErrorStateWidget((state).exception);
            }
          }),
        ));
  }
}
