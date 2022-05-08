import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'priceUid': priceUid,
      'unitUid': unitUid,
      'prices': prices.map((x) => x.toMap()).toList(),
      'units': units.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      priceUid: map['priceUid'] ?? '',
      unitUid: map['unitUid'] ?? '',
      prices: List<Price>.from(map['prices']?.map((x) => Price.fromMap(x))),
      units: List<Unit>.from(map['units']?.map((x) => Unit.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
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

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'value': value,
    };
  }

  factory Price.fromMap(Map<String, dynamic> map) {
    return Price(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Price.fromJson(String source) => Price.fromMap(json.decode(source));
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

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'value': value,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) => Unit.fromMap(json.decode(source));
}
