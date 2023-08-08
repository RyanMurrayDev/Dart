import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappy_bird/components/FlappyBirdGame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HighScoreButton {
  FlappyBirdGame game;
  Rect highScoreRect;
  Sprite highScoreSprite;

  HighScoreButton(game) {
    this.game = game;
    highScoreSprite = Sprite("button/highScoreButton.png");
    highScoreRect = Rect.fromLTWH(
        game.screenSize.width * (1 / 10), game.screenSize.height * (8 / 10)
        , game.screenSize.width / 8, game.screenSize.height / 15);
  }

  void render(Canvas c) {
    highScoreSprite.renderRect(c, highScoreRect);
  }

  void onTap() {
    print("tapped high score button");
  }
}