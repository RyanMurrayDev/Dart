import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappy_bird/components/FlappyBirdGame.dart';

import 'GameState.dart';



class Bird {
  FlappyBirdGame game;
  Rect birdRect;
  Sprite birdSprite;

  Bird(game) {
    this.game = game;
    birdSprite = Sprite("birds/yellowBird.png");
    birdRect = Rect.fromLTWH(game.screenSize.width/10,game.screenSize.height/4
        , game.screenSize.width/15, game.screenSize.height/35);
  }

  void reset(game){
    this.game = game;
    birdSprite = Sprite("birds/yellowBird.png");
    birdRect = Rect.fromLTWH(game.screenSize.width/10,game.screenSize.height/4
        , game.screenSize.width/15, game.screenSize.height/35);
  }

  void render(Canvas c) {
    birdSprite.renderRect(c, birdRect);
  }

  void update(){
    if(this.birdRect.intersect(game.foreground.fgRect).width > 0 && this.birdRect.intersect(game.foreground.fgRect).height > 0) {
      //bird intersects fg
      game.gameState = GameState.stopped;
    }
    if(game.gameState == GameState.ongoing){
      birdRect = Rect.fromLTWH(game.screenSize.width/10, birdRect.top+5,game.screenSize.width/15, game.screenSize.height/35);
    }
  }


  void onTap(Size size){
    if(game.gameState == GameState.ongoing)
      {
        birdRect = Rect.fromLTWH(game.screenSize.width/10, birdRect.top-35,game.screenSize.width/15, game.screenSize.height/35);
      }
    else{
      game.gameState = GameState.ongoing;
      game.reset();
    }
  }

}