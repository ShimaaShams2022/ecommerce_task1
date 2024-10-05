import 'package:ecommerce_task1/data/api_model/responses/ProductResponse.dart';
import 'package:injectable/injectable.dart';

import '../../domain/Result.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/product_online_data_source.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
  ProductOnlineDataSource dataSource;
 @factoryMethod
  ProductRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<ProductResponse>?>> getProduct(){
      return dataSource.getProduct();
  }

}