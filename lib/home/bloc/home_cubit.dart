import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two/entities/product.dart';
import 'package:two/home/bloc/home_state.dart';
import 'package:two/main.dart';
import 'package:two/repository/product_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final ProductRepository pr = getIt<ProductRepository>();

  void _toggleLoadingState(bool isLoading) {
    emit(HomeState(
      product: state.product,
      isLoading: isLoading,
    ));
  }

  Future<void> getData() async {
    _toggleLoadingState(true);
    await Future.delayed(const Duration(seconds: 2));
    var response = await pr.getProduct();
    List<Product> product = response ?? [];
    emit(HomeState(product: product));
    _toggleLoadingState(false);
  }
}
