import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappy_bird/components/FlappyBirdGame.dart';

class Foreground {
  FlappyBirdGame game;
  Rect fgRect;
  Sprite fgSprite;


  Foreground(game) {
    resize(game);
    this.game = game;
    fgSprite = Sprite("bg/fg.png");

  }

  void render(Canvas c) {
    fgSprite.renderRect(c, fgRect);
  }

  void resize(game) {
    fgRect = Rect.fromLTWH(0, game.screenSize.height*(3/4), game.screenSize.width, game.screenSize.height/4);
  }

}