import 'dart:math';
import 'package:reaction_color/app/core/arrays.dart';
import 'package:reaction_color/app/core/constants.dart';
import 'package:reaction_color/app/domain/entities/color_square_entity.dart';

class GameViewModel {
  //score
  int score = 0;

  //time
  int milisecondsCurrent = 0;
  int time = GameSetting.timeSecondsRoundInitial;
  int milisecondsForShuffle = 0;
  int timeMilisecondShuffle = GameSetting.timeMilisecondsShuffleInitial;

  //colors
  ColorSquareEntity colorRequest = _getNextColor();
  String lastColorRequest = "";

  //control game
  bool gameOver = false;
  bool menuInitialActive = true;

  List<ColorSquareEntity> listColorSquare =
      List.from(ArraysConstants.colorSquares);

  onTapColorSquare(ColorSquareEntity colorSquare) {
    if (colorSquare.id == colorRequest.id) {
      score += 10;
      _requestNewColor();
      _decrementShuffle();
      time++;
    } else {
      decrementTime(decrement: 2);
    }
  }

  shuffle({bool force = false}) {
    if (force || milisecondsForShuffle >= timeMilisecondShuffle) {
      listColorSquare.shuffle();
      milisecondsForShuffle = 0;
    }
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
    time = GameSetting.timeSecondsRoundInitial;
    colorRequest = _getNextColor();
    milisecondsCurrent = 0;
    milisecondsForShuffle = 0;
    timeMilisecondShuffle = GameSetting.timeMilisecondsShuffleInitial;
  }

  void decrementTime({int decrement = 1}) {
    if ((milisecondsCurrent % 1000) == 0 && (time - decrement) >= 0) {
      time--;
    }
  }

  _decrementShuffle() {
    if (timeMilisecondShuffle - 200 >
        GameSetting.timeMaxMilisecondsForShuffle) {
      timeMilisecondShuffle -= 200;
    }
  }
}
