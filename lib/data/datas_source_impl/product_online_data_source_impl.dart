import 'package:ecommerce_task1/data/api_model/responses/ProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../../domain/Result.dart';
import '../api_model/api_manager/api_manager.dart';
import '../data_source/product_online_data_source.dart';




@Injectable(as: ProductOnlineDataSource)
class RecommendedOnlineDataSourceImpl implements ProductOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  RecommendedOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<ProductResponse>?>> getProduct() {
  return apiManager.loadProduct();
  //dependency
  }

}