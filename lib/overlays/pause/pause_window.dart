import 'package:dino_run_game/overlays/pause/pause_button.dart';
import 'package:flutter/material.dart';

import '../../game/dino_game.dart';

class WidgetPauseMenu extends StatelessWidget {
  final DinoGame gameOverlay;
  static String pauseMenuId = "PauseMenuId";
  const WidgetPauseMenu({Key? key, required this.gameOverlay})
      : super(key: key);

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
                "Game Paused",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              InkWell(
                onTap: () {
                  ///By clicking Game Pause button game engine will resume.

                  gameOverlay.resumeEngine();
                  gameOverlay.overlays.remove(WidgetPauseMenu.pauseMenuId);
                  gameOverlay.overlays.add(PauseButton.pauseButtonId);
                  gameOverlay.enemyManager.timer.resume();
                  if (gameOverlay.enemyManager.newEnemy != null) {
                    gameOverlay.enemyManager.newEnemy!.removeFromParent();
                  }
                },
                child: Container(
                  height: 60,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.yellow),
                  child: const Text(
                    "Resume",
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
