import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tap_n_tap/components/score_text.dart';
import 'package:tap_n_tap/components/tile_rect.dart';

class GameController extends Game with TapDetector {
  final SharedPreferences storage;
  Random rand;
  Size screenSize;
  int countX;
  int countY;
  double tileWidth;
  double tileHeight;
  List<TileRect> tiles;
  ScoreText scoreText;
  int score;

  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    rand = Random();
    countX = 6;
    countY = 8;
    resize(await Flame.util.initialDimensions());
    tiles = List<TileRect> ();
    for (int i=0; i<countX; i++) {
      for (int j=0; j<countY; j++) {
        tiles.add(TileRect(this, i*tileWidth, j*tileHeight + tileHeight/2));
      }
    }
    int pos = rand.nextInt(tiles.length);
    tiles[pos].wake();
    score = 0;
    scoreText = ScoreText(this);
  }

  @override
  void render(Canvas c) {
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);

    tiles.forEach((TileRect tile) => tile.render(c));
    scoreText.render(c);
  }

  @override
  void update(double t) {
    scoreText.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileWidth = screenSize.width / countX;
    tileHeight = screenSize.height / (countY+1);
  }

  @override
  void onTapDown(TapDownDetails d) {
    tiles.forEach((TileRect tile) {
      if (tile.tile.contains(d.globalPosition)) {
        tile.onTapDown();
      }
    });
    // One Nice Bug -- Looks Good
    int pos = rand.nextInt(tiles.length);
    tiles[pos].wake();
  }

}