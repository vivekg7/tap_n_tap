
import 'dart:ui';

import 'package:tap_n_tap/game_controller.dart';

class Player {

  final GameController gameController;
  int maxHealth;
  int currentHealth;
  bool isDead;

  Player(this.gameController) {
    maxHealth = currentHealth = 3000;
    isDead = false;
  }

  void render(Canvas c) {
    // TODO: no need for now
  }

  void update(double t) {
    currentHealth = currentHealth>0?currentHealth-1:0;
    if (!isDead && currentHealth <= 0) {
      isDead = true;
      // reset game
    }
  }

}