import 'package:flutter/material.dart';
import 'package:reaction_color/app/presentation/pages/game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reaction Color',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: GameView(),
    );
  }
}
