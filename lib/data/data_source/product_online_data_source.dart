

import 'package:ecommerce_task1/data/api_model/responses/ProductResponse.dart';

import '../../domain/Result.dart';

abstract class ProductOnlineDataSource{
  Future<Result<List<ProductResponse>?>> getProduct();
}