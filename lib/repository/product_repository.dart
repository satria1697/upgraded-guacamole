import 'package:dio/dio.dart';
import 'package:two/entities/product.dart';
import 'package:two/interfaces/repository/product_repository_interface.dart';

class ProductRepository implements ProductRepositoryInterface {
  final Dio client;

  ProductRepository(this.client);

  @override
  Future<List<Product>?> getProduct() async {
    var response = await client.get('/products');
    var product = ProductResponse.fromJson(response.data);
    return product.products;
  }
}
