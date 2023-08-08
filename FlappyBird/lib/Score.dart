import 'package:sqflite/sqlite_api.dart';

class Score {
  int id;
  String username;
  String score;

  Score.create({this.username, this.score});

  Score({this.id,this.username,this.score});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'score': score,
    };
  }
  @override
  String toString() {
    return 'User{id: $id, username: $username, score: $score}';
  }

  static Future<void> insertScore(Database db,Score score) async {
    await db.insert(
      'scores',
      score.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Score>> scores(Database db,) async {
    //final List<Map<String, dynamic>> maps = await db.query('scores');
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM scores ORDER BY score DESC");
    List<Score> scores = [];
    for(int i=0; i < maps.length; i++){
      scores.add(Score(
          id:maps[i]['id'],
          username:maps[i]['username'],
          score:maps[i]['score']));
    }
    return scores;

  }

  static Future<List<Score>> scoresByUsername(Database db,String username) async {
    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM scores where username=? ORDER BY score DESC",[username]);
    List<Score> scores = [];
    for(int i=0; i < maps.length; i++){
      scores.add(Score(
          id:maps[i]['id'],
          username:maps[i]['username'],
          score:maps[i]['score']));
    }
    return scores;
  }

  static Future<void> updateScores(Database db,Score score) async {
    await db.update(
      'scores',
      score.toMap(),
      where: "id = ?",
      whereArgs: [score.id],
    );
  }

  static Future<void> deleteScore(Database db,int id) async {
    await db.delete(
      'scores',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}