import 'package:equatable/equatable.dart';
import 'package:two/entities/product.dart';

class HomeState extends Equatable {
  final List<Product> product;
  final bool isLoading;

  const HomeState({this.product = const [], this.isLoading = false});

  HomeState copyWith({List<Product>? product, bool? isLoading}) {
    return HomeState(
      product: product ?? this.product,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [product, isLoading];
}
