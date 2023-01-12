import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:two/entities/product.dart';
import 'package:two/repository/product_repository.dart';
import 'package:two/services/api.dart';

GetIt getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton<Dio>(Api().invoke());
  getIt.registerSingleton<ProductRepository>(ProductRepository(getIt()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product?> _product = [];

  ProductRepository pr = getIt<ProductRepository>();

  void _getData() async {
    var product = await pr.getProduct();
    setState(() {
      _product = product ?? [];
    });
  }

  String _setPrice(int? price) {
    return "${price}000";
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _product.length,
        itemBuilder: (context, index) {
          Product product = _product[index] ?? Product();
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            child: Row(
              children: [
                Image(
                  image: NetworkImage(product.images?[0] ?? '', scale: 6),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title ?? ""),
                    Text(_setPrice(product.price)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
