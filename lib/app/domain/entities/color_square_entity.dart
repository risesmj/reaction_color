import 'package:flutter/animation.dart';

class ColorSquareEntity {
  String id;
  String name;
  Color? hex;

  ColorSquareEntity({
    required this.id,
    this.hex,
    required this.name,
  });

  @override
  String toString() {
    return name;
  }
}
