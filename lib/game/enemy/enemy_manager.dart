import 'dart:math';

import 'package:dino_run_game/game/dino_game.dart';
import 'package:flame/components.dart';

import 'enemy.dart';

class EnemyManager extends Component with HasGameRef<DinoGame> {
  //This class manages all the enemy's properties.

  /// A timer that will be used to spawn enemies.
  late Timer timer;

  /// Setting the spawn level to 0, It will increase with time .
  int spawnLevel = 0;

  /// Setting the speed of the enemy, It will increase with time .
  double enemySpeed = 300;

  /// Object of Enemy.
  Enemy? newEnemy;

  /// A constructor for the EnemyManager class.
  EnemyManager() {
    timer = Timer(3, repeat: true, onTick: () {
      spawnRandomEnemy();
    });
  }

  /// > This function spawns a random enemy at a random location
  void spawnRandomEnemy() {
    final int randomNumber = Random().nextInt(EnemyType.values.length);
    final EnemyType randomEnemyType = EnemyType.values.elementAt(randomNumber);
    newEnemy = Enemy(randomEnemyType, enemySpeed);
    gameRef.add(newEnemy!);
  }

  ///This method will start the timer once the component is attached to ui.
  @override
  void onMount() {
    timer.start();
    super.onMount();
  }

  /// > The update function is called every frame and is used to update the state of
  /// the game
  ///
  /// Args:
  ///   dt (double): The time in seconds since the last update.
  @override
  void update(double dt) {
    timer.update(dt);
    int random = (Random().nextInt(3) + 2);
    int newSpawnLevel = gameRef.score ~/ 100;
    if ((newSpawnLevel > spawnLevel)) {
      spawnLevel = newSpawnLevel;
      timer.stop();
      if (spawnLevel < 40) {
        ///if the score is between 100 - 4000 the number and speed of spawning enemy will be increasing.
        double newTime = random / (1 + (0.04 * spawnLevel));
        timer = Timer(newTime, repeat: true, onTick: () {
          enemySpeed += 15;
          spawnRandomEnemy();
        });
      } else {
        /// once score is >4000 the speed will be constant.
        double newTime = random / (1 + (0.03 * 40));
        timer = Timer(newTime, repeat: true, onTick: () {
          spawnRandomEnemy();
        });
      }
      timer.start();
    }
    super.update(dt);
  }
}
