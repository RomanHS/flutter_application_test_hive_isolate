import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/domain/models/Product.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter_application_8/db.dart';
import 'package:path_provider/path_provider.dart';

Future<List<Product>> _productsLol() async {
  final Directory appDir = await getApplicationDocumentsDirectory();

  final products = await compute(generateProducts, true);

  final res = await compute(sjfsdfsdfsdf, Params(appDir: appDir, products: products));

  return res;
}

Future<bool> productsLol() async {
  final Directory appDir = await getApplicationDocumentsDirectory();

  return await compute(__productsLol, appDir);
}

Future<bool> __productsLol(Directory appDir) async {
  final products = generateProducts(true);

  await sjfsdfsdfsdf(Params(appDir: appDir, products: products));

  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<bool>(
          future: productsLol(),
          builder: (_, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(
              child: Text('data'),
            );
            // return ListView.builder(
            //   itemCount: data.length,
            //   itemBuilder: (_, i) {
            //     final product = data[i];
            //     return ListTile(
            //       title: Text(product.name),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}
