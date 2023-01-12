import 'package:dio/dio.dart';
import 'package:two/interfaces/services/api_interface.dart';

class Api implements ApiInterface {
  @override
  Dio invoke() {
    print('ok');
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://dummyjson.com",
        connectTimeout: 9000,
        receiveTimeout: 8000,
      ),
    );
    print(dio);
    return dio;
  }
}
