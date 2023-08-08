import 'dart:math';
import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:flappy_bird/components/FlappyBirdGame.dart';
import 'package:flappy_bird/components/GameState.dart';

//4 sets of pipes set A,B,C,D
class Pipes {
  FlappyBirdGame game;
  Random rnd;
  Sprite northPipeASprite;
  Sprite southPipeASprite;
  Rect northPipeARect;
  Rect southPipeARect;
  Sprite northPipeBSprite;
  Sprite southPipeBSprite;
  Rect northPipeBRect;
  Rect southPipeBRect;
  Sprite northPipeCSprite;
  Sprite southPipeCSprite;
  Rect northPipeCRect;
  Rect southPipeCRect;
  Sprite northPipeDSprite;
  Sprite southPipeDSprite;
  Rect northPipeDRect;
  Rect southPipeDRect;
  double numA;
  double numB;
  double numC;
  double numD;
  double gap;

  Pipes(game) {
    this.game = game;
    gap = game.screenSize.height/10;
    rnd = Random();
    // gets random integer within height of screen
    //rnd.nextInt(game.screenSize.height.toInt()-50).toDouble()
    numA = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numA+=game.screenSize.height*(1/5);
    //print(numA.toString());
    northPipeARect = Rect.fromLTWH(game.screenSize.width*(1/2), 0, game.screenSize.width/12, numA);
    southPipeARect = Rect.fromLTWH(game.screenSize.width*(1/2), numA+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numA+gap));
    northPipeASprite = Sprite("pipes/pipeNorth.png");
    southPipeASprite = Sprite("pipes/pipeSouth.png");
    numB = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numB+=game.screenSize.height*(1/5);
    // left game.screenSize.width*(1)
    northPipeBRect = Rect.fromLTWH(game.screenSize.width*(1), 0, game.screenSize.width/12, numB);
    southPipeBRect = Rect.fromLTWH(game.screenSize.width*(1), numB+gap, game.screenSize.width/12, game.screenSize.height*(3/4)-(numB+gap));
    northPipeBSprite = Sprite("pipes/pipeNorth.png");
    southPipeBSprite = Sprite("pipes/pipeSouth.png");
    numC = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numC+=game.screenSize.height*(1/5);
    // left game.screenSize.width*(1.5)
    northPipeCRect = Rect.fromLTWH(game.screenSize.width*(1.5), 0, game.screenSize.width/12, numC);
    southPipeCRect = Rect.fromLTWH(game.screenSize.width*(1.5), numC+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numC+gap));
    northPipeCSprite = Sprite("pipes/pipeNorth.png");
    southPipeCSprite = Sprite("pipes/pipeSouth.png");
    numD = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numD+=game.screenSize.height*(1/5);
    // left game.screenSize.width*(2)
    northPipeDRect = Rect.fromLTWH(game.screenSize.width*(2), 0, game.screenSize.width/12, numD);
    southPipeDRect = Rect.fromLTWH(game.screenSize.width*(2), numD+gap, game.screenSize.width/12, game.screenSize.height*(3/4)-(numD+gap));
    northPipeDSprite = Sprite("pipes/pipeNorth.png");
    southPipeDSprite = Sprite("pipes/pipeSouth.png");
  }

  void reset(game){
    this.game = game;
    gap = game.screenSize.height/10;
    rnd = Random();
    numA = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numA+=game.screenSize.height*(1/5);
    //print(numA.toString());
    northPipeARect = Rect.fromLTWH(game.screenSize.width*(1/2), 0, game.screenSize.width/12, numA);
    southPipeARect = Rect.fromLTWH(game.screenSize.width*(1/2), numA+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numA+gap));
    northPipeASprite = Sprite("pipes/pipeNorth.png");
    southPipeASprite = Sprite("pipes/pipeSouth.png");
    numB = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numB+=game.screenSize.height*(1/5);
    //left game.screenSize.width*(1)
    northPipeBRect = Rect.fromLTWH(game.screenSize.width*(1), 0, game.screenSize.width/12, numB);
    southPipeBRect = Rect.fromLTWH(game.screenSize.width*(1), numB+gap, game.screenSize.width/12, game.screenSize.height*(3/4)-(numB+gap));
    northPipeBSprite = Sprite("pipes/pipeNorth.png");
    southPipeBSprite = Sprite("pipes/pipeSouth.png");
    numC = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numC+=game.screenSize.height*(1/5);
    //left game.screenSize.width*(1.5)
    northPipeCRect = Rect.fromLTWH(game.screenSize.width*(1.5), 0, game.screenSize.width/12, numC);
    southPipeCRect = Rect.fromLTWH(game.screenSize.width*(1.5), numC+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numC+gap));
    northPipeCSprite = Sprite("pipes/pipeNorth.png");
    southPipeCSprite = Sprite("pipes/pipeSouth.png");
    numD = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
    numD+=game.screenSize.height*(1/5);
    //left game.screenSize.width*(2)
    northPipeDRect = Rect.fromLTWH(game.screenSize.width*(2), 0, game.screenSize.width/12, numD);
    southPipeDRect = Rect.fromLTWH(game.screenSize.width*(2), numD+gap, game.screenSize.width/12, game.screenSize.height*(3/4)-(numD+gap));
    northPipeDSprite = Sprite("pipes/pipeNorth.png");
    southPipeDSprite = Sprite("pipes/pipeSouth.png");
  }

  void render(Canvas c) {
    northPipeASprite.renderRect(c, northPipeARect);
    southPipeASprite.renderRect(c, southPipeARect);
    northPipeBSprite.renderRect(c, northPipeBRect);
    southPipeBSprite.renderRect(c, southPipeBRect);
    northPipeCSprite.renderRect(c, northPipeCRect);
    southPipeCSprite.renderRect(c, southPipeCRect);
    northPipeDSprite.renderRect(c, northPipeDRect);
    southPipeDSprite.renderRect(c, southPipeDRect);
  }

  void resize() {}

  void isIntersecting(){
    if(this.northPipeARect.intersect(game.bird.birdRect).width > 0 && this.northPipeARect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects north pipe A
      game.gameState = GameState.stopped;
    }
    else if(this.southPipeARect.intersect(game.bird.birdRect).width > 0 && this.southPipeARect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects south pipe A
      game.gameState = GameState.stopped;
    }
    else if(this.northPipeBRect.intersect(game.bird.birdRect).width > 0 && this.northPipeBRect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects north pipe B
      game.gameState = GameState.stopped;
    }
    else if(this.southPipeBRect.intersect(game.bird.birdRect).width > 0 && this.southPipeBRect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects south pipe B
      game.gameState = GameState.stopped;
    }
    else if(this.northPipeCRect.intersect(game.bird.birdRect).width > 0 && this.northPipeCRect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects north pipe C
      game.gameState = GameState.stopped;
    }
    else if(this.southPipeCRect.intersect(game.bird.birdRect).width > 0 && this.southPipeCRect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects south pipe C
      game.gameState = GameState.stopped;
    }
    else if(this.northPipeDRect.intersect(game.bird.birdRect).width > 0 && this.northPipeDRect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects north pipe D
      game.gameState = GameState.stopped;
    }
    else if(this.southPipeDRect.intersect(game.bird.birdRect).width > 0 && this.southPipeDRect.intersect(game.bird.birdRect).height > 0) {
      //bird intersects south pipe D
      game.gameState = GameState.stopped;
    }
  }

  bool isOffScreen(Rect pipeRect){
    if(pipeRect.right < 0){
      return true;
    }
    else{
      return false;
    }
  }

  void update() {
    if(game.gameState == GameState.ongoing){
      //move each pipeRect over
      northPipeARect = Rect.fromLTWH(northPipeARect.left-5, 0, game.screenSize.width/12, numA);
      southPipeARect = Rect.fromLTWH(southPipeARect.left-5, numA+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numA+gap));
      northPipeBRect = Rect.fromLTWH(northPipeBRect.left-5, 0, game.screenSize.width/12, numB);
      southPipeBRect = Rect.fromLTWH(southPipeBRect.left-5, numB+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numB+gap));
      northPipeCRect = Rect.fromLTWH(northPipeCRect.left-5, 0, game.screenSize.width/12, numC);
      southPipeCRect = Rect.fromLTWH(southPipeCRect.left-5, numC+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numC+gap));
      northPipeDRect = Rect.fromLTWH(northPipeDRect.left-5, 0, game.screenSize.width/12, numD);
      southPipeDRect = Rect.fromLTWH(southPipeDRect.left-5, numD+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numD+gap));

    }
    this.isIntersecting();
    //sets of pipes have same left values so only need to check one
    if(isOffScreen(northPipeARect)){
      //move pipes back to other side of screen
      //create new random num
      numA = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
      numA+=game.screenSize.height*(1/5);
      northPipeARect = Rect.fromLTWH(game.screenSize.width*(2), 0, game.screenSize.width/12, numA);
      southPipeARect = Rect.fromLTWH(game.screenSize.width*(2), numA+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numA+gap));

    }
    else if(isOffScreen(northPipeBRect)){
      //move pipes back to other side of screen
      numB = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
      numB+=game.screenSize.height*(1/5);
      northPipeBRect = Rect.fromLTWH(game.screenSize.width*(2), 0, game.screenSize.width/12, numB);
      southPipeBRect = Rect.fromLTWH(game.screenSize.width*(2), numB+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numB+gap));

    }
    else if(isOffScreen(northPipeCRect)){
      //move pipes back to other side of screen
      numC = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
      numC+=game.screenSize.height*(1/5);
      northPipeCRect = Rect.fromLTWH(game.screenSize.width*(2), 0, game.screenSize.width/12, numC);
      southPipeCRect = Rect.fromLTWH(game.screenSize.width*(2), numC+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numC+gap));

    }
    else if(isOffScreen(northPipeDRect)){
      //move pipes back to other side of screen
      numD = rnd.nextInt((game.screenSize.height*(3/8)).toInt()).toDouble();
      numD+=game.screenSize.height*(1/5);
      northPipeDRect = Rect.fromLTWH(game.screenSize.width*(2), 0, game.screenSize.width/12, numD);
      southPipeDRect = Rect.fromLTWH(game.screenSize.width*(2), numD+gap,game.screenSize.width/12, game.screenSize.height*(3/4)-(numD+gap));

    }
    //check left position and add one to score if at birds position
    if(northPipeARect.left == game.bird.birdRect.left || northPipeBRect.left == game.bird.birdRect.left
        || northPipeCRect.left == game.bird.birdRect.left|| northPipeDRect.left == game.bird.birdRect.left){
      game.score++;
    }
  }
  }



