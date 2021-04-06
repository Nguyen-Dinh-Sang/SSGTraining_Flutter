import 'dart:async';
import 'dart:developer';
import 'package:flutter_provider/event/ProductEvent.dart';

import 'Base/BaseEvent.dart';
import 'Product.dart';
import 'ProductState.dart';

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

  final eventController = StreamController<BaseEvent>();

  final stateController = StreamController<ProductState>();

  ProductBloc() {
    eventController.stream.listen((event) {
      if (event is SearchEvent) {
        String key = event.key.toLowerCase().trim();

        searchData(key).then((value) {
          state = ProductState(value);
          stateController.sink.add(state);
        });
      }
    });
  }

  Future<List<Product>> searchData(String key) async {
    List<Product> filterList = <Product>[];
    log(key);

    // await Future.delayed(Duration(seconds: 5), () => log('wait 5s'));

    if (key == null || key.length == 0) {
      filterList.addAll(product);
    } else {
      product.forEach((element) {
        if (element.productName.toLowerCase().contains(key)) {
          filterList.add(element);
        }
      });
    }

    return filterList;
  }
}
