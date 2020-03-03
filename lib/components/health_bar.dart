
import 'dart:ui';

import 'package:tap_n_tap/game_controller.dart';

class HealthBar {

  final GameController gameController;
  Rect healthBarRect;
  Rect remainingRect;

  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.5;
    healthBarRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height - gameController.tileHeight * 0.45,
      barWidth,
      gameController.tileHeight * 0.35,
    );
    remainingRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height - gameController.tileHeight * 0.45,
      barWidth,
      gameController.tileHeight * 0.35,
    );
  }

  void render(Canvas c) {
    Paint healthBarColor = Paint()..color = Color(0xFFFF0000);
    Paint remainingColor = Paint()..color = Color(0xFF00FF00);
    c.drawRect(healthBarRect, healthBarColor);
    c.drawRect(remainingRect, remainingColor);
  }

  void update(double t) {
    double barWidth = gameController.screenSize.width / 1.5;
    double percentHealth = gameController.player.currentHealth / gameController.player.maxHealth;
    remainingRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height - gameController.tileHeight * 0.45,
      barWidth * percentHealth,
      gameController.tileHeight * 0.35,
    );
  }

}