import 'package:hive_flutter/hive_flutter.dart';

part 'Product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String priceUid;
  @HiveField(3)
  final String unitUid;
  @HiveField(4)
  final List<Price> prices;
  @HiveField(5)
  final List<Unit> units;
  
  Product({
    required this.uid,
    required this.name,
    required this.priceUid,
    required this.unitUid,
    required this.prices,
    required this.units,
  });
}

@HiveType(typeId: 2)
class Price {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double value;
  Price({
    required this.uid,
    required this.name,
    required this.value,
  });
}

@HiveType(typeId: 3)
class Unit {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double value;
  Unit({
    required this.uid,
    required this.name,
    required this.value,
  });
}
