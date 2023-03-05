class ModelEnemyType {
  final int start;
  final int end;
  final int amount;
  final String image;
  final double height;
  final double width;
  final double textureheight;
  final double texturewidth;
  bool canFly;
  ModelEnemyType(
      {required this.start,
      required this.end,
      required this.amount,
      required this.image,
      required this.height,
      required this.width,
      required this.textureheight,
      required this.texturewidth,
      this.canFly = false});
}
