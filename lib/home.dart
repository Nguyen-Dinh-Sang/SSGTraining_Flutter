import 'package:flutter/material.dart';
import 'package:flutter_exercise/Product.dart';
import 'package:flutter_exercise/main.dart';

class HomePage extends StatelessWidget {
  TextEditingController searchController = new TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search)
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return buildListTile(product[index], index);
            }),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(Product product, int index) {
    return ListTile(
      title: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.pink[50],
        child: Align(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Index: ' + index.toString(),
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Name: ' + product.productName,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Type: ' + product.productType,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Total: ' + product.totalProduct.toString(),
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
      );
  }
}
class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
