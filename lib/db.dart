import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_application_8/core/domain/models/Product.dart';

class Params {
  final Directory appDir;
  final Map<String, Product> products;

  Params({
    required this.appDir,
    required this.products,
  });
}

Future<List<Product>> sjfsdfsdfsdf(Params params) async {
  Hive.init(params.appDir.path);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(PriceAdapter());
  Hive.registerAdapter(UnitAdapter());
  final Box<Product> box = await Hive.openBox<Product>('products');
  await box.putAll(params.products);
  return params.products.values.toList();
}

Map<String, Product> generateProducts(bool value) {
  return Map.fromEntries(List.generate(1000000, (index) {
    final product = Product(
      uid: '$index',
      name: 'Product $index',
      priceUid: '0',
      unitUid: '0',
      prices: List.generate(25, (index) => Price(uid: '$index', name: 'Price $index', value: index * 100)),
      units: List.generate(25, (index) => Unit(uid: '$index', name: 'Unit $index', value: index * 100)),
    );
    return MapEntry(product.uid, product);
  }));
}

class A {
  final String text;

  A({
    required this.text,
  });
}

Future<Isolate> createIsolate() async {
  final Isolate isolate = await Isolate.spawn<A>((message) {
    log(message.text);
  }, A(text: 'start'));
  return isolate;
}
