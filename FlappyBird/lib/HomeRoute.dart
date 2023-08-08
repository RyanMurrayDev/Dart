import 'package:flappy_bird/components/FlappyBirdGame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GameRoute.dart';
import 'HighScores.dart';



String username = '';

class HomeRoute extends StatefulWidget {
  FlappyBirdGame game;
  HomeRoute(this.game);
  HomeRouteState createState() => HomeRouteState(game);
}

class HomeRouteState extends State<HomeRoute> {
  TextEditingController user = new TextEditingController();
  FlappyBirdGame game;
  HomeRouteState(this.game);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Stack(
            children: <Widget>[
              Center(
                child: new Image.asset(
                  'assets/images/bg/background.png',
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Flappy Bird",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35.0, color: Colors.yellow),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    TextField(
                      controller: user,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    RaisedButton(
                      child: Text(
                        "Play",
                        style: new TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    GameRoute(game, user.text) //pass in game and username
                                ));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    RaisedButton(
                      child: Text(
                        "Get High Scores",
                        style: new TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HighScores()));
                      },
                    ),
                  ],
                ),
              ),
            ]));
  }
}
