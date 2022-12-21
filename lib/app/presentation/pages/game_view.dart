import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reaction_color/app/presentation/modal/game_over_modal.dart';
import 'package:reaction_color/app/presentation/modal/menu_modal.dart';
import 'package:reaction_color/app/presentation/pages/game_view_model.dart';
import 'package:reaction_color/app/presentation/widgets/square_widget.dart';

class GameView extends StatefulWidget {
  final GameViewModel viewModel = GameViewModel();
  GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!widget.viewModel.gameOver && !widget.viewModel.menuInitialActive) {
          widget.viewModel.decrementTime();
          print(widget.viewModel.seconds);

          if (widget.viewModel.seconds <= 0) {
            widget.viewModel.gameOver = true;
          }
        }

        widget.viewModel.shuffle();

        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.viewModel.colorRequest.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "press start2p regular",
                    ),
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(minWidth: 300, maxWidth: 300.0),
                  height: 400,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 120,
                            childAspectRatio: 1,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 2),
                    itemBuilder: (context, index) => SquareWidget(
                      onTap: () {
                        setState(() {
                          widget.viewModel.onTapColorSquare(
                            widget.viewModel.listColorSquare[index],
                          );
                        });
                      },
                      entity: widget.viewModel.listColorSquare[index],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Pontuação: ${widget.viewModel.score}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "press start2p regular",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Tempo: ${widget.viewModel.seconds}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "press start2p regular",
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.viewModel.menuInitialActive)
            MenuModal(
              onStart: () {
                setState(() {
                  widget.viewModel.startGame();
                });
              },
            ),
          if (widget.viewModel.gameOver && !widget.viewModel.menuInitialActive)
            GameOverModal(
              score: widget.viewModel.score,
              onRetry: () {
                setState(() {
                  widget.viewModel.reset();
                });
              },
            ),
        ],
      )),
    );
  }
}
