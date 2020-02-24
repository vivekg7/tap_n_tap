import 'dart:ui';

import 'package:tap_n_tap/game_controller.dart';

class TileRect {

  final GameController gameController;
  Rect tile;
  bool isAlive;

  TileRect(this.gameController, double x, double y) {
    tile = Rect.fromLTWH(
        x,
        y,
        gameController.tileWidth-1,
        gameController.tileHeight-1,
    );
    isAlive = false;
  }

  void render(Canvas c) {
    Paint color;
    if (isAlive) {
      color = Paint()..color = Color(0xFFFFFFFF);
    } else {
      color = Paint()..color = Color(0xFF000000);
    }
    c.drawRect(tile, color);
  }

  void update(double t) {
    // I don't think it's needed
  }

  void onTapDown() {
    if (isAlive) {
      isAlive = false;
      gameController.score++;
    } else {
      // decrease health or kill
      gameController.score--;
    }
  }

  void wake() {
    if (!isAlive) isAlive = true;
  }

}