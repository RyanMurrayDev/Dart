import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeRoute.dart';
import 'components/FlappyBirdGame.dart';

FlappyBirdGame game;

void main() async{
  String username = 'anonymous';


    Util flameUtil = Util();
    //await flameUtil.fullScreen();
    await flameUtil.setOrientation(DeviceOrientation.portraitUp);
    final Size size  = await Flame.util.initialDimensions();

    SharedPreferences storage = await SharedPreferences.getInstance();

    await Flame.images.loadAll(<String>[
      'bg/background.png',
      'bg/fg.png',
      'birds/yellowBird.png',
      'pipes/pipeNorth.png',
      'pipes/pipeSouth.png',
      'button/homeButton.png',
      'button/highScoreButton.png',
    ]);

    game = FlappyBirdGame(size,username);
    runApp(MyApp());

  //for testing game class  runs game right away
    //runApp(game.widget);
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flappy Bird",
      //pass in game
      home: HomeRoute(game),
    );
  }

}