import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class GameOverModal extends StatelessWidget {
  final VoidCallback? onRetry;
  final int score;

  const GameOverModal({
    this.onRetry,
    required this.score,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Pontuação: $score",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "press start2p regular",
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Fim de Jogo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "press start2p regular",
              ),
            ),
          ),
          IconButton(
            onPressed: onRetry,
            iconSize: 50,
            icon: const Icon(
              CommunityMaterialIcons.restart,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
