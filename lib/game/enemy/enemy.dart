import 'dart:math';

import 'package:dino_run_game/model/model_enemy.dart';
import 'package:flame/cache.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../constant/constants.dart';

class Enemy extends SpriteAnimationComponent {
  //This is a base class of enemy which contains all the function related
  //animation and speed.

  /// A late variable which is used to store the data of the animation.
  late SpriteAnimationData data;

  /// A variable which is used to store the data of the animation.
  late SpriteAnimationData runData;

  /// Used to store the screen size.
  late Vector2 screenSize;

  /// Used to store the speed of the enemy.
  final double speedX;

  /// Used to store the speed of the enemy.
  final imagesLoader = Images();

  /// Used to store the data of the animation.
  late SpriteAnimationComponent enemyAnimation;

  /// Used to store the fps of the game.
  late double fpsData;

  /// A late variable which is used to store the data of the animation.
  late ModelEnemyType enemy;

  ///it is a constructor if this class.
  Enemy(
    EnemyType enemyType,
    this.speedX,
  ) {
    enemy = mapEnemy[enemyType]!;
    data = SpriteAnimationData.range(
      start: enemy.start,
      end: enemy.end,
      textureSize: Vector2(enemy.textureheight, enemy.texturewidth),
      amount: enemy.amount,
      loop: true,
      stepTimes: List.generate(enemy.amount - 1, (index) => 0.1),
    );
    animate(enemy);
  }

  /// A function that takes in a ModelEnemyType and returns a Future.
  ///
  /// Args:
  ///   enemy (ModelEnemyType): The enemy to animate.
  animate(ModelEnemyType enemy) async {
    enemyAnimation = SpriteAnimationComponent.fromFrameData(
      await imagesLoader.load(enemy.image),
      data,
    )..size = Vector2(
        mapEnemy[EnemyType.rock]!.height, mapEnemy[EnemyType.rock]!.width);
    add(enemyAnimation);
  }

  /// > The update function is called every frame and is used to update the state of
  /// the game
  ///
  /// Args:
  ///   dt (double): The time in seconds since the last update.
  @override
  void update(double dt) {
    super.update(dt);
    x -= speedX * dt;
    if (x <= -(width)) {
      removeFromParent();
    }
  }

  /// It's a function that takes a function as an argument and returns a function
  @override
  void onMount() {
    size *= 0.6;
    add(
      RectangleHitbox.relative(
        Vector2.all(0.8),
        parentSize: size,
        position: Vector2(size.x * 0.2, size.y * 0.2),
      ),
    );
    super.onMount();
  }

  /// "When the game is resized,
  /// update the camera's aspect ratio."
  ///
  /// Args:
  ///   size (Vector2): The new size of the game window.
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    double scaleFactor =
        (size.x / dinoSpacing) / mapEnemy[EnemyType.rock]!.texturewidth;
    height = scaleFactor * mapEnemy[EnemyType.rock]!.textureheight;
    width = scaleFactor * mapEnemy[EnemyType.rock]!.texturewidth;
    x = size.x + width;
    screenSize = size;
    if (enemy.canFly) {
      y = size.y - groundHeight - height - Random().nextInt(100);
    } else {
      y = size.y - groundHeight - height;
    }
  }
}

/// Creating an enum called EnemyType with three values: bird, rock, and ghost.
enum EnemyType { bird, rock, ghost }
