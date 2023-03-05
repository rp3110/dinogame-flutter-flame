import 'package:dino_run_game/overlays/pause/pause_button.dart';
import 'package:flutter/material.dart';

import '../../game/dino_game.dart';

class WidgetGameOver extends StatelessWidget {
  /// A reference to the [DinoGame] object.
  final DinoGame gameOverlay;

  /// A static variable that is used to identify the gameOver widget.
  static String gameOverId = "gameOverId";

  /// A static variable that is used to identify the gameOver widget.
  static bool gameOver = false;

  const WidgetGameOver({Key? key, required this.gameOverlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Game Over",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
              InkWell(
                onTap: () {
                  /// by tapping play again.
                  /// Some properties will be reset.
                  /// and the game over overlay will be removed.
                  gameOverlay.resumeEngine();
                  gameOverlay.overlays.remove(gameOverId);
                  gameOverlay.score = 0;
                  gameOverlay.enemyManager.timer.start();
                  gameOverlay.enemyManager.enemySpeed = 300;
                  gameOverlay.overlays.add(PauseButton.pauseButtonId);
                  gameOverlay.enemyManager.newEnemy!.removeFromParent();
                  gameOver = false;
                },
                child: Container(
                  height: 60,
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.yellow),
                  child: const Text(
                    "Play Again",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
