

import '../../data/api_model/responses/ProductResponse.dart';
import '../Result.dart';

abstract class ProductRepository{
Future<Result<List<ProductResponse>?>> getProduct();
}