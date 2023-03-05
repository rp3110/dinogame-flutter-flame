import 'package:dino_run_game/overlays/gameover/game_over_window.dart';
import 'package:dino_run_game/overlays/pause/pause_button.dart';
import 'package:dino_run_game/overlays/pause/pause_window.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game/dino_game.dart';

DinoGame dinoGame = DinoGame();

class GameOverlay extends StatefulWidget {
  const GameOverlay({Key? key}) : super(key: key);

  @override
  State<GameOverlay> createState() => _GameOverlayState();
}

class _GameOverlayState extends State<GameOverlay> {
  //This class is used to show pause menu,pause button and game over menu.

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: dinoGame,
      initialActiveOverlays: [PauseButton.pauseButtonId],
      overlayBuilderMap: {
        PauseButton.pauseButtonId:
            (BuildContext context, DinoGame gameOverlay) {
          return PauseButton(
            gameOverlay: gameOverlay,
          );
        },
        WidgetPauseMenu.pauseMenuId:
            (BuildContext context, DinoGame gameOverlay) {
          return WidgetPauseMenu(
            gameOverlay: gameOverlay,
          );
        },
        WidgetGameOver.gameOverId:
            (BuildContext context, DinoGame gameOverlay) {
          return WidgetGameOver(
            gameOverlay: gameOverlay,
          );
        },
      },
    );
  }
}
