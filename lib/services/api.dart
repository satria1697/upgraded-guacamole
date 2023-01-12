import 'package:dio/dio.dart';
import 'package:two/interfaces/services/api_interface.dart';

class Api implements ApiInterface {
  @override
  Dio invoke() {
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://dummyjson.com",
        connectTimeout: 9000,
        receiveTimeout: 8000,
      ),
    );
    return dio;
  }
}
