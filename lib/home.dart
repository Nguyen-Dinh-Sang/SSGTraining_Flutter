import 'package:flutter/material.dart';
import 'package:flutter_exercise/Product.dart';
import 'package:flutter_exercise/ProductBloc.dart';
import 'package:flutter_exercise/ProductEvent.dart';
import 'package:flutter_exercise/ProductState.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: SearchProduct(),
    );
  }
}

class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  final bloc = ProductBloc();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      bloc.eventController.sink.add(SearchEvent(searchController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc.eventController.sink.add(SearchEvent(''));
    return StreamBuilder<ProductState>(
        stream: bloc.stateController.stream,
        initialData: bloc.state,
        builder: (BuildContext context, AsyncSnapshot<ProductState> snapshot) {
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      labelText: 'Search', prefixIcon: Icon(Icons.search)),
                ),
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return buildListTile(snapshot.data.product[index], index);
                }),
              )
            ],
          );
        });
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
