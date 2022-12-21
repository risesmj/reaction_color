import 'package:flutter/material.dart';
import 'package:reaction_color/app/domain/entities/color_square_entity.dart';

class SquareWidget extends StatefulWidget {
  final ColorSquareEntity entity;
  final VoidCallback? onTap;

  const SquareWidget({
    required this.entity,
    this.onTap,
    super.key,
  });

  @override
  State<SquareWidget> createState() => _SquareWidgetState();
}

class _SquareWidgetState extends State<SquareWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(8),
        color: Colors.black,
        child: Container(
          color: widget.entity.hex,
        ),
      ),
    );
  }
}
