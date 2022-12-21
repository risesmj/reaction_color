import 'package:flutter/material.dart';
import 'package:reaction_color/app/domain/entities/color_square_entity.dart';

class ArraysConstants {
  static final List<ColorSquareEntity> colorSquares = [
    ColorSquareEntity(
      id: 'yellow',
      name: 'Amarelo',
      hex: Colors.yellow,
    ),
    ColorSquareEntity(
      id: 'red',
      name: 'Vermelho',
      hex: const Color.fromARGB(255, 255, 17, 0),
    ),
    ColorSquareEntity(
      id: 'blue',
      name: 'Azul',
      hex: Colors.blue,
    ),
    ColorSquareEntity(
      id: 'purple',
      name: 'Roxo',
      hex: Colors.purple,
    ),
    ColorSquareEntity(
      id: 'pink',
      name: 'Rosa',
      hex: const Color.fromARGB(255, 249, 97, 148),
    ),
    ColorSquareEntity(
      id: 'brown',
      name: 'Marron',
      hex: Colors.brown,
    ),
    ColorSquareEntity(
      id: 'white',
      name: 'Branco',
      hex: Colors.white,
    ),
    ColorSquareEntity(
      id: 'orange',
      name: 'Laranja',
      hex: const Color.fromARGB(255, 255, 119, 0),
    ),
    ColorSquareEntity(
      id: 'green',
      name: 'Verde',
      hex: Colors.green,
    ),
  ];
}
