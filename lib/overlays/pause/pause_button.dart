import 'package:dino_run_game/game/dino_game.dart';
import 'package:dino_run_game/overlays/pause/pause_window.dart';
import 'package:flutter/material.dart';

import '../../game/enemy/enemy_manager.dart';

class PauseButton extends StatelessWidget {
  final DinoGame gameOverlay;
  PauseButton({Key? key, required this.gameOverlay}) : super(key: key);
  final EnemyManager enemy = EnemyManager();

  static String pauseButtonId = "PauseButtonId";
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () {
          ///by clicking pause button the game engine will pause.
          gameOverlay.pauseEngine();
          gameOverlay.enemyManager.timer.pause();
          gameOverlay.overlays.add(WidgetPauseMenu.pauseMenuId);
          gameOverlay.overlays.remove(PauseButton.pauseButtonId);
        },
        child: const Icon(Icons.pause),
      ),
    );
  }
}
