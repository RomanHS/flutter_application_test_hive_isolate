import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/domain/models/Product.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:flutter_application_8/db.dart';
import 'package:path_provider/path_provider.dart';

Future<List<Product>> productsLol() async {
  final Directory appDir = await getApplicationDocumentsDirectory();
  log('start generate');
  final products = await compute(generateProducts, true);
  log('finash generate');
  log('start put database');
  final res = await compute(sjfsdfsdfsdf, Params(appDir: appDir, products: products));
  log('finash put database');
  return res;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<List<Product>>(
          future: productsLol(),
          builder: (_, snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, i) {
                final product = data[i];
                return ListTile(
                  title: Text(product.name),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
