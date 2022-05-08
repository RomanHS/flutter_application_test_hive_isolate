import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_application_8/core/presentation/MyApp.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory appDir = await getApplicationDocumentsDirectory();
  Hive.init(appDir.path);
  final Box<String> box = await Hive.openBox<String>('testBox');
  await box.add(box.length.toString());
  box.close();
  // final products = await compute(generateProducts, true);
  // final res = await compute(sjfsdfsdfsdf, Params(appDir: appDir, products: products));
  runApp(const MyApp());
}
