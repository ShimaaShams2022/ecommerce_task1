
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ecommerce_task1/data/api_model/responses/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_task1/data/api_model/api_manager/ErrorResponse.dart';
import '../../../domain/Result.dart';

@singleton
class ApiManager {
  final dio = Dio();

  ApiManager() {
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) {
        debugPrint(object.toString());
      },
    ));
  }

  static String baseUrl = "https://fakestoreapi.com";
  static String productUrl = "$baseUrl/products";

  Future<Result<List<ProductResponse>?>> loadProduct() async {
    try {
      var response = await dio.get(productUrl);

      if (response.statusCode?.isSuccessCall() == true) {
        List<ProductResponse> productResponse = (response.data as List)
            .map((i) => ProductResponse.fromJson(i))
            .toList();
        return Success(data: productResponse);
      } else {
        var errorResponse = ErrorResponse.fromJson(response.data);
        return ServerError(ServerErrorException(errorResponse.statusMessage));
      }
    } on DioException catch (dioError) {
      if (dioError.error is SocketException) {
        return Error(ServerErrorException('No Internet Connection'));
      }
      return Error(ServerErrorException(dioError.message));
    } on Exception catch (ex) {
      return Error(ServerErrorException(ex.toString()));
    }
  }
}

extension HttpExtention on int {
  bool isSuccessCall() {
    return this >= 200 && this < 300;
  }
}