import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/backButton.dart';
import 'package:flappy_bird/components/highScoreButton.dart';
import 'package:flappy_bird/components/pipes.dart';
import 'package:flappy_bird/components/scoreDisplay.dart';
import 'package:flappy_bird/components/playAgainDisplay.dart';
import 'package:flutter/gestures.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Score.dart';
import 'GameState.dart';
import 'background.dart';
import 'bird.dart';
import 'foreground.dart';


class FlappyBirdGame extends BaseGame {
  Size screenSize;
  double tileSize;
  Random rnd;
  GameState gameState;
  Bird bird;
  Pipes pipes;
  Background background;
  Foreground foreground;
  ScoreDisplay scoreDisplay;
  PlayAgainDisplay playAgainDisplay;
  bool inserted;
  String name;
  //BackButton back;
  //HighScoreButton highScoreButton;
  int score;
  Score userScore;
  Database database;

  FlappyBirdGame(Size size, String username) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    rnd = Random();
    gameState = GameState.stopped;
    bird = Bird(this);
    pipes = Pipes(this);
    background = Background(this);
    foreground = Foreground(this);
    score = 0;
    scoreDisplay = ScoreDisplay(this);
    playAgainDisplay = PlayAgainDisplay(this);
    inserted = false;
    name = username;
    print(name);
    //back = BackButton(this);
    //highScoreButton = HighScoreButton(this);
    getDatabasesPath().then((dbPath) {
      dbPath = join(dbPath, "scores_database.db");
      openDatabase(
          dbPath,
          version: 1,
          onCreate: (db, version) async {
            return db.execute('''
                    CREATE TABLE scores(
                    id INTEGER PRIMARY KEY,
                    username TEXT, 
                    score TEXT)'''
            );
          }).then((db) {
        database = db;
      });
    });
  }

  void render(Canvas canvas) {
    background.render(canvas);
    foreground.render(canvas);
    bird.render(canvas);
    pipes.render(canvas);
    scoreDisplay.render(canvas);
    playAgainDisplay.render(canvas);
    //back.render(canvas);
    //highScoreButton.render(canvas);
  }

  Future update(double t) {
    bird.update();
    pipes.update();
    scoreDisplay.update();
    playAgainDisplay.update();
  }

  void resize(Size size) {
    tileSize = screenSize.width / 9;
    scoreDisplay?.resize();
    playAgainDisplay?.resize();
    background?.resize();
  }

  void onTapDown(TapDownDetails d) {
    /*if(back.backRect.contains(d.globalPosition)){
      back.onTap();
    }
    else if(highScoreButton.highScoreRect.contains(d.globalPosition)){
      highScoreButton.onTap();
    }
    else{

    }*/
    bird.onTap(this.screenSize);
    if(this.gameState == GameState.stopped && inserted == false && score != 0 && name != "")
    {
      print("insert user: " + name + " score: " + score.toString());
      userScore = Score(username: name, score: score.toString());
      Score.insertScore(database, userScore);
      inserted = true;
    }
  }

  void reset(){
   bird.reset(this);
   pipes.reset(this);
   score = 0;
   inserted = false;
  }

}

