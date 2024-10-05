

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/api_model/responses/ProductResponse.dart';
import '../../domain/Result.dart';
import '../../domain/repository/product_repository.dart';



@injectable

class ProductViewModel extends Cubit<ProductHomeState>{
  ProductRepository productRepository;

  ProductViewModel(this.productRepository) : super(ProductLoadingState());



  void loadProductHomeScreen()async {

    emit(ProductLoadingState());

    var result=await productRepository.getProduct();

    switch(result){
      case Success():{
        emit(ProductSuccessState(result.data));
      }
      case ServerError<List<ProductResponse>>():{
        emit(ProductErrorState(result.exception));
      }

      case Error<List<ProductResponse>>():{
        emit(ProductErrorState(result.exception));
      }

      default:{

      }

    }

  }
}

sealed class ProductHomeState {}

class ProductLoadingState extends ProductHomeState {}

class ProductSuccessState extends ProductHomeState {
  List<ProductResponse>? productResults;
  ProductSuccessState(this.productResults);

}

class ProductErrorState extends ProductHomeState {
  Exception exception;
  ProductErrorState(this.exception);
}
