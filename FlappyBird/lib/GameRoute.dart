import 'package:flappy_bird/components/FlappyBirdGame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameRoute extends StatefulWidget {
  FlappyBirdGame game;
  String username;
  GameRoute(this.game, this.username);
  GameRouteState createState() => GameRouteState(game,username);
}

class GameRouteState extends State<GameRoute> {
  String username;
  FlappyBirdGame game;
  GameRouteState(this.game,this.username);


  @override
  void initState() {
    super.initState();
    //print("username is: " + username);
    run();
  }


  void run() async {
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

    //print(username);
    game = FlappyBirdGame(size, username);
    //runApp(game.widget);

    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = game.onTapDown;
    flameUtil.addGestureRecognizer(tapper);
  }

 @override
  Widget build(BuildContext context) {
   Size size = MediaQuery
       .of(context)
       .size;
   return Scaffold(
       appBar: AppBar(
         title: Text("Flappy Bird Game"),
       ),
       body: Container(
           child: game.widget,
       ));
 }
}
