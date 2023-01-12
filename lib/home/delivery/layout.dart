import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two/entities/product.dart';
import 'package:two/home/bloc/home_cubit.dart';
import 'package:two/home/delivery/box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeCubit _homeCubit = HomeCubit();

  @override
  void initState() {
    _homeCubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => _homeCubit,
        child: BlocBuilder<HomeCubit, HomeCubitState>(
          builder: (context, state) {
            if (state.isLoading ?? false) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Loading'),
                  ],
                ),
              );
            } else {
              if (state.product.isEmpty) {
                return const Center(child: Text('Empty Data'));
              }
              return ListView.builder(
                itemCount: state.product.length,
                itemBuilder: (context, index) {
                  Product product = state.product[index];
                  return MiBox(product: product);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
