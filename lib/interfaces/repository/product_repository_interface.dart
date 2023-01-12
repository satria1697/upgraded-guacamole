import 'package:two/entities/product.dart';

abstract class ProductRepositoryInterface {
  Future<List<Product>?> getProduct();
}
