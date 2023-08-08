import 'dart:ui';
import 'package:flappy_bird/components/FlappyBirdGame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'GameState.dart';

class PlayAgainDisplay {
  final FlappyBirdGame game;
  TextPainter painter;
  Offset position;

  PlayAgainDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    position = Offset.zero;
  }

  void render(Canvas c) {
    if(game.gameState == GameState.stopped)
      {
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
      text: "Score: " + game.score.toString() + "\n\nClick to play!",
      style: TextStyle(
        color: Colors.black,
        fontSize: game.tileSize*(3/4),
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
    position = Offset(game.screenSize.width*(2.5/10), game.screenSize.height*(4.5/10));
  }
}
