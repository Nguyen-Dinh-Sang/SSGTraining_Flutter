import 'dart:async';

import 'package:flutter_exercise/Product.dart';
import 'package:flutter_exercise/ProductEvent.dart';
import 'package:flutter_exercise/ProductState.dart';

class ProductBloc {
  List<Product> product = <Product>[
    new Product('Dell E6530', 'Laptop', 10),
    new Product('Dell Gaming', 'Laptop', 12),
    new Product('Macbook M1', 'Laptop', 1),
    new Product('Samsung', 'SSD', 100),
    new Product('ADATA', 'SSD', 310),
    new Product('Kington', 'SSD', 103),
    new Product('Honda', 'Motor', 102),
    new Product('Yamaha', 'Motor', 101),
    new Product('Suzuki', 'Motor', 130),
    new Product('HP', 'Laptop', 18),
    new Product('Thinkpad', 'Laptop', 198)
  ];

  ProductState state;

  final eventController = StreamController<ProductEvent>();

  final stateController = StreamController<ProductState>();

  ProductBloc() {
    eventController.stream.listen((event) {
      if (event is SearchEvent) {
        String key = event.key;
        state = ProductState(product);
        stateController.sink.add(state);
      }
    });
  }
}
