// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api_model/api_manager/api_manager.dart' as _i778;
import 'data/data_source/product_online_data_source.dart' as _i1015;
import 'data/datas_source_impl/product_online_data_source_impl.dart' as _i264;
import 'data/repository_impl/product_repository_impl.dart' as _i732;
import 'domain/repository/product_repository.dart' as _i570;
import 'presentation/view_models/product_view_model.dart' as _i634;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i778.ApiManager>(() => _i778.ApiManager());
    gh.factory<_i1015.ProductOnlineDataSource>(
        () => _i264.RecommendedOnlineDataSourceImpl(gh<_i778.ApiManager>()));
    gh.factory<_i570.ProductRepository>(() =>
        _i732.ProductRepositoryImpl(gh<_i1015.ProductOnlineDataSource>()));
    gh.factory<_i634.ProductViewModel>(
        () => _i634.ProductViewModel(gh<_i570.ProductRepository>()));
    return this;
  }
}
