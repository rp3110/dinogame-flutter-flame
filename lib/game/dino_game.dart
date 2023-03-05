import 'dart:ui';

import 'package:dino_run_game/game/dino/dino.dart';
import 'package:dino_run_game/game/enemy/enemy_manager.dart';
import 'package:dino_run_game/overlays/gameover/game_over_window.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';

import '../overlays/pause/pause_button.dart';
import '../overlays/pause/pause_window.dart';

class DinoGame extends FlameGame with TapDetector, HasCollisionDetection {
  /// A variable that is used to store the animation data.
  late SpriteAnimationData animationData;

  /// A variable that is used to store the parallax animation data.
  late ParallaxComponent _parallaxComponent;

  /// A variable that is used to store the dino object.
  late Dino dino;

  /// A variable that is used to store the enemy manager object.
  late EnemyManager enemyManager;

  /// A variable that is used to store the score.
  int score = 0;

  /// Used to store the fps data.
  late int fpsData;

  /// Creating a text component that will be used to display the score.
  TextComponent scoreText = TextComponent(text: "");

  /// A function that is called when the page is loaded.
  @override
  Future<void> onLoad() async {
    _parallaxComponent = await loadParallaxComponent([
      ParallaxImageData("parallax/plx-1.png"),
      ParallaxImageData("parallax/plx-2.png"),
      ParallaxImageData("parallax/plx-3.png"),
      ParallaxImageData("parallax/plx-4.png"),
      ParallaxImageData("parallax/plx-5.png"),
      ParallaxImageData("parallax/plx-6.png"),
    ],
        baseVelocity: Vector2(100, 0),
        velocityMultiplierDelta: Vector2(1.05, 0));
    add(_parallaxComponent);
    dino = Dino();
    dino.run();
    add(dino);
    enemyManager = EnemyManager();
    add(enemyManager);
    scoreText = TextComponent(text: score.toString());
    scoreText.position.x = (canvasSize.x / 2) - (scoreText.width);
    scoreText.position.y = 7;
    add(scoreText);
  }

  /// > When the app's lifecycle state changes, call the
  /// `_handleLifecycleStateChange` function
  ///
  /// Args:
  ///   state (AppLifecycleState): The new state of the app.
  ///   if the game is in some as below the game will pause.
  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        if (!WidgetGameOver.gameOver) {
          pauseEngine();
          overlays.add(WidgetPauseMenu.pauseMenuId);
          overlays.remove(PauseButton.pauseButtonId);
        }
        break;
      case AppLifecycleState.inactive:
        if (!WidgetGameOver.gameOver) {
          pauseEngine();
          overlays.add(WidgetPauseMenu.pauseMenuId);
          overlays.remove(PauseButton.pauseButtonId);
        }
        break;
      case AppLifecycleState.paused:
        if (!WidgetGameOver.gameOver) {
          pauseEngine();
          overlays.add(WidgetPauseMenu.pauseMenuId);
          overlays.remove(PauseButton.pauseButtonId);
        }
        break;
      case AppLifecycleState.resumed:
        break;
    }
  }

  /// > The `update` function is called every frame, and it's where you should
  /// update the state of your game
  ///
  /// Args:
  ///   dt (double): The time in seconds since the last update.
  @override
  void update(double dt) async {
    super.update(dt);

    if (dt < 0.016) {
      fpsData = 120;
    } else {
      fpsData = 60;
    }
    score += (fpsData * dt).toInt();
    scoreText.text = score.toString();
  }

  /// When the user taps down on the screen, call the onTapDown function and
  /// jump method will be called.
  ///
  /// Args:
  ///   info (TapDownInfo): This is the information about the tap down event.
  @override
  void onTapDown(TapDownInfo info) {
    dino.jump();
    super.onTapDown(info);
  }
}
