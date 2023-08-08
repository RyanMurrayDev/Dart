import 'dart:ui';
import 'package:flappy_bird/components/FlappyBirdGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'GameState.dart';

class ScoreDisplay {
  final FlappyBirdGame game;
  TextPainter painter;
  Offset position;

  ScoreDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    position = Offset.zero;
  }

  void render(Canvas c) {
    if(game.gameState == GameState.ongoing){
      painter.layout();
      painter.paint(c, position);
    }

  }

  void update() {
    if ((painter.text?.text ?? '') != game.score.toString()) {
      resize();
    }
  }

  void resize() {
    painter.text = TextSpan(
      text: "Score: " + game.score.toString(),
      style: TextStyle(
        color: Colors.black,
        fontSize: game.tileSize,
        shadows: <Shadow>[
          Shadow(
            blurRadius: game.tileSize * .25,
            color: Colors.white,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
    painter.layout();
    position = Offset(game.screenSize.width*(3/10), game.screenSize.height*(8/10));
  }
}
