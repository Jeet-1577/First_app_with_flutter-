import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final int days = 30;

  final String name = "codee";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final CatalogJason =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(CatalogJason);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    print(CatalogModel.items); // Check if items are printed
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "catalog app",
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 17,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.deepPurple),
                          ),
                          child: Image.asset(item.image),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                        ));
                  },
                  itemCount: CatalogModel.items.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: mydrawer(),
    );
  }
}
