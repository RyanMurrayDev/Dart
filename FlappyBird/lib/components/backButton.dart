import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappy_bird/components/FlappyBirdGame.dart';

import 'GameState.dart';



class BackButton {
  FlappyBirdGame game;
  Rect backRect;
  Sprite backSprite;

  BackButton(game) {
    this.game = game;
    backSprite = Sprite("button/homeButton.png");
    backRect = Rect.fromLTWH(game.screenSize.width*(8/10),game.screenSize.height*(8/10)
        , game.screenSize.width/8, game.screenSize.height/10);
  }

  void render(Canvas c) {
    backSprite.renderRect(c, backRect);
  }

  void onTap(){
    print("tapped Home");

  }

}