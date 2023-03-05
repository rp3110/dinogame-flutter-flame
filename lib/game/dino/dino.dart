import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../../overlays/gameover/game_over_window.dart';
import '../../overlays/pause/pause_button.dart';
import '../constant/constants.dart';
import '../dino_game.dart';

class Dino extends SpriteAnimationComponent
    with HasGameRef<DinoGame>, CollisionCallbacks {
  //This class is for Dino which handles all the events like animation,run,
  //jump,collision,speed and many other stuff.

  /// A static variable which is used to store the data of the sprite animation.
  static late SpriteAnimationData data;

  /// A variable which is used to store the data of the sprite animation.
  late SpriteAnimationData runData;

  /// Used to store the speed of the dino for jump.
  double speedY = 0.0;

  /// Used to store the maximum height of the dino.
  double maxY = 0.0;

  /// Used to store the custom gravity of the dino.
  double gravity = 1200;

  /// Used to load the image from the assets folder.
  final Images imagesLoader = Images();

  /// It creates a new instance of the Dino class.
  Dino() {
    runData = SpriteAnimationData.range(
      start: 4,
      end: 9,
      textureSize: Vector2.all(24.0),
      amount: 24,
      loop: true,
      stepTimes: [
        0.1,
        0.1,
        0.1,
        0.1,
        0.1,
        0.1,
      ],
    );
  }

  /// An asynchronous function for generate animation.
  animate() async {
    SpriteAnimationComponent dino = SpriteAnimationComponent.fromFrameData(
      await imagesLoader.load("DinoSprites - vita.png"),
      data,
    )..size = Vector2(100, 100);

    add(dino);
  }

  /// It is used to display run animation.
  void run() {
    data = runData;
    animate();
  }

  /// This function returns true if the player is on the ground, and false
  /// otherwise.
  bool isOnGround() {
    return (y >= maxY);
  }

  ///this function is used to make dino jump
  void jump() {
    if ((speedY <= 0) && (y > 154)) {
      speedY = -500;
    }
  }

  /// A collision detection function.
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    gameRef.pauseEngine();
    gameRef.enemyManager.timer.stop();
    gameRef.overlays.add(WidgetGameOver.gameOverId);
    gameRef.overlays.remove(PauseButton.pauseButtonId);
    WidgetGameOver.gameOver = true;
    super.onCollisionStart(intersectionPoints, other);
  }

  /// It's a function that takes a function as an argument and returns a function
  @override
  void onMount() {
    add(
      RectangleHitbox.relative(
        Vector2.all(0.8),
        parentSize: size..x = x * 0.7,
        position: Vector2(size.x * 0.4, size.y * 0.2),
      ),
    );
    super.onMount();
  }

  /// > The update function is called every frame and is used to update the state of
  /// the game
  ///
  /// Args:
  ///   dt (double): The time in seconds since the last update.
  @override
  void update(double dt) {
    super.update(dt);
    speedY += gravity * dt * 1.1;
    y += speedY * dt * 1.2;
    if (isOnGround()) {
      y = maxY;
      speedY = 0;
    }
  }

  /// "When the game is resized,
  /// update the camera's aspect ratio."
  ///
  /// Args:
  ///   size (Vector2): The new size of the game window.
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    height = width = size.x / dinoPerScreen;
    x = width;
    y = size.y - groundHeight - height - dinoSpacing - 10;
    maxY = y;
  }
}
