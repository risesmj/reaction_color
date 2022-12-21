import 'dart:math';
import 'package:reaction_color/app/core/arrays.dart';
import 'package:reaction_color/app/core/constants.dart';
import 'package:reaction_color/app/domain/entities/color_square_entity.dart';

class GameViewModel {
  int score = 0;
  int seconds = 5;
  int milisecondsForShuffle = GameSetting.timeMilisecondsShuffle;
  ColorSquareEntity colorRequest = _getNextColor();
  String lastColorRequest = "";
  bool gameOver = false;
  bool menuInitialActive = true;
  int timeShuffle = GameSetting.timeMilisecondsShuffle;

  List<ColorSquareEntity> listColorSquare =
      List.from(ArraysConstants.colorSquares);

  onTapColorSquare(ColorSquareEntity colorSquare) {
    if (colorSquare.id == colorRequest.id) {
      score += 10;
      _requestNewColor();
      shuffle();
      seconds++;
    } else {
      decrementTime(decrement: 2);
    }
  }

  shuffle() {
    listColorSquare.shuffle();
  }

  _requestNewColor() {
    var newColor = _getNextColor();
    while (lastColorRequest == newColor.id) {
      newColor = _getNextColor();
    }
    lastColorRequest = newColor.id;
    colorRequest = newColor;
  }

  static _getNextColor() => ArraysConstants.colorSquares[Random().nextInt(9)];

  startGame() {
    menuInitialActive = false;
    reset();
  }

  reset() {
    score = 0;
    gameOver = false;
    seconds = 5;
    colorRequest = _getNextColor();
  }

  void decrementTime({int decrement = 1}) {
    if ((seconds - decrement) >= 0) {
      seconds--;
    }
  }
}
