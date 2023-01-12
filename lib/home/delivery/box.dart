import 'package:flutter/material.dart';
import 'package:two/entities/product.dart';

class MiBox extends StatefulWidget {
  final Product product;

  const MiBox({Key? key, required this.product}) : super(key: key);

  @override
  State<MiBox> createState() => _MiBoxState();
}

class _MiBoxState extends State<MiBox> {
  String _setPrice(int? price) {
    return "${price}000";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image(
            image: NetworkImage(widget.product.images?[0] ?? '', scale: 6),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.product.title ?? ""),
              Text(_setPrice(widget.product.price)),
            ],
          ),
        ],
      ),
    );
  }
}
