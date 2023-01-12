import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two/entities/product.dart';
import 'package:two/main.dart';
import 'package:two/repository/product_repository.dart';

class HomeCubitState extends Equatable {
  final List<Product> product;
  final bool? isLoading;

  const HomeCubitState({required this.product, this.isLoading});

  @override
  List<Object?> get props => [product, isLoading];

  HomeCubitState copyWith({
    List<Product>? product,
    bool? isLoading,
  }) {
    return HomeCubitState(
      isLoading: isLoading ?? this.isLoading,
      product: product ?? this.product,
    );
  }
}

class HomeCubitStateInitial extends HomeCubitState {
  const HomeCubitStateInitial({required super.product});
}

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit()
      : super(const HomeCubitState(
          isLoading: true,
          product: [],
        ));

  final ProductRepository pr = getIt<ProductRepository>();

  void _toggleLoadingState(bool isLoading) {
    emit(HomeCubitState(
      product: state.product,
      isLoading: isLoading,
    ));
  }

  Future<void> getData() async {
    _toggleLoadingState(true);
    await Future.delayed(const Duration(seconds: 2));
    var response = await pr.getProduct();
    List<Product> product = response ?? [];
    emit(HomeCubitState(product: product));
    _toggleLoadingState(false);
  }
}
