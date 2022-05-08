import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_8/core/domain/models/Product.dart';

import 'package:flutter_application_8/core/presentation/MyApp.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  log('main()');

  WidgetsFlutterBinding.ensureInitialized();

  final Directory appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);

  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(PriceAdapter());
  Hive.registerAdapter(UnitAdapter());

  final LazyBox<Product> box = await Hive.openLazyBox<Product>('products');
  log(box.length.toString());
  // await box.close();

  log('runApp(const MyApp());');
  runApp(const MyApp());
}
