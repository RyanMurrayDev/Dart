import 'dart:ui';
import 'package:flame/sprite.dart';

import 'FlappyBirdGame.dart';



class Background {
  final FlappyBirdGame game;
  Sprite bgSprite;
  Rect bgRect;
  Sprite boundarySprite;
  Rect boundaryRect;

  Background(this.game) {
    bgSprite = Sprite('bg/bg.png');
    resize();
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void resize() {
    bgRect = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9,
      game.tileSize * 23,
    );
    boundaryRect = Rect.fromLTWH(
        0,
        game.screenSize.height - (game.screenSize.height*0.1),
        game.screenSize.width,
        game.screenSize.height*0.1);
  }

  void update(double t) {}
}
