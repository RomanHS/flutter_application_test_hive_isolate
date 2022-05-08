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
  log('start put database ${DateTime.now()}');
  log('init');
  Hive.init(params.appDir.path);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(PriceAdapter());
  Hive.registerAdapter(UnitAdapter());
  // final Box<Product> box = await Hive.openBox<Product>('products');
  final LazyBox<Product> box = await Hive.openLazyBox<Product>('products');

  // final Box<String> box = await Hive.openBox<String>('productsString');

  log('entries ${DateTime.now()}');

  // final entries = params.products.entries.toList();

  // const max = 10000;
  // final kol = entries.length ~/ max;
  // final ost = entries.length % max;

  // final List<Future<void>> futures = [];

  // for (int i = 0; i < kol; i++) {
  //   log(i.toString());
  //   final range = entries.getRange(i, i + max);
  //   final future = box.putAll(Map.fromEntries(range));
  //   futures.add(future);
  // }

  // if (ost != 0) {
  //   final range = entries.getRange(entries.length - ost, entries.length);
  //   final future = box.putAll(Map.fromIterable(range));
  //   futures.add(future);
  // }

  // await Future.wait(futures);

  await box.putAll(params.products);

  await box.close();

  // await box.putAll(params.products.map((key, value) => MapEntry(key, json.encode(value.toJson()))));
  log('finash put database ${DateTime.now()}');
  return params.products.values.toList();
}

Map<String, Product> generateProducts(bool value) {
  log('start generate');
  final res = Map.fromEntries(List.generate(100000, (index) {
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
  log('finash generate');
  return res;
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
