import '../../model/model_enemy.dart';
import '../enemy/enemy.dart';

/// Defining a constant variable called groundHeight and setting it to 32.
const double groundHeight = 32;

/// Defining a constant variable called dinoSpacing and setting it to 10.75.
const double dinoSpacing = 10.75;

/// Defining a constant variable called dinoPerScreen and setting it to 10.
const double dinoPerScreen = 10;

/// Map containing enemy data.
Map<EnemyType, ModelEnemyType> mapEnemy = {
  EnemyType.bird: ModelEnemyType(
      image: "Flying (32x32).png",
      amount: 9,
      start: 1,
      end: 8,
      width: 70,
      height: 70,
      textureheight: 32,
      texturewidth: 32,
      canFly: true),
  EnemyType.ghost: ModelEnemyType(
      image: "ghost (44x30).png",
      amount: 10,
      start: 1,
      end: 9,
      width: 70,
      height: 70,
      textureheight: 44,
      texturewidth: 30),
  EnemyType.rock: ModelEnemyType(
      image: "Rock1_Idle (38x34).png",
      amount: 14,
      start: 1,
      end: 13,
      width: 70,
      height: 70,
      textureheight: 38,
      texturewidth: 34),
};
