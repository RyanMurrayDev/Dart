import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Score.dart';


class HighScores extends StatefulWidget {
  HighScoresState createState() => HighScoresState();

}
class HighScoresState extends State<HighScores> {
  List<Score> _scores = [];
  TextEditingController usernameController;
  TextEditingController scoreController;
  Database database;
  int currentUpdateId = -1;

  void resetForm() {
    usernameController.clear();
    currentUpdateId = -1;
  }

  void refreshScores() async {
    var scores = await Score.scores(database);
    setState(() {
      _scores = scores;
    });
  }

  void scoresByUser(String name) async {
    var scores = await Score.scoresByUsername(database, name);
    setState(() {
      _scores = scores;
    });
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getDatabasesPath().then((dbPath) {
      dbPath = join(dbPath, "scores_database.db");
     // print("dbPath: " + dbPath);

      /* Database database;
      getDatabasesPath().then((dbPath){
        dbPath = join(dbPath,"scores_database.db");
        print("dbPath: "+dbPath);
        deleteDatabase(dbPath).then((res){
          print("database wiped!");
        });
      });*/

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
       // print("db: " + database.toString());
        refreshScores();
      });
    });
    usernameController = TextEditingController();
    scoreController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: AppBar(
        title: Text("High Scores"),
      ),
          body: Container(
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/bg/background.png"), fit: BoxFit.cover),),
              child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20),),
                      TextField(
                        controller: usernameController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Enter username"
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20),),
                      RaisedButton(
                        child: Text("Get Scores By User"),
                        onPressed: () async {
                        scoresByUser(usernameController.text);
                        },
                      ),
                      Padding(padding: EdgeInsets.all(20),),
                      RaisedButton(
                        child: Text("Get All Scores"),
                        onPressed: () async {
                          refreshScores();
                        },
                      ),
                      Padding(padding: EdgeInsets.all(20),),
                      Expanded(
                        child:ListView.builder(
                            itemCount: _scores.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                //leading: Text(""),
                                title: Text(_scores[index].username + ": " + _scores[index].score,
                                  textAlign: TextAlign.center,),
                                //subtitle: Text(""),
                              );
                            }
                        ),
                      )
                    ],
                  )
              ),
          ),
        );
  }
}