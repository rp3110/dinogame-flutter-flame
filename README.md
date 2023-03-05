# Simple DinoGame with flame game engine

Flame is a modular Flutter game engine that provides a complete set of out-of-the-way solutions for games. It takes advantage of the powerful infrastructure provided by Flutter but simplifies the code you need to build your projects.
So, In this project I have created a basic "DinoRun" game.

[![Flame logo](https://github.com/rp3110/dinogame-flutter-flame/blob/main/screenshot/flame_logo.png "Flame logo")

- Flutter App
- Flame


# Features
- Android
- web
- Dino game like chrome
- Using **flutter_flame**.




# Let's Code
- Add these dependencies in **pubspec.yaml** and hit **Pub Get**


|     dependencies             |
|------------------------------|
|     flutter_displaymode      |

- use following function in *MyApp*'s ```initState()``` to set maximum refresh rate to 60fps .
  
```
  /// It set the max fps to 60.
  refreshRate() async {
    await FlutterDisplayMode.setLowRefreshRate();
  }
``` 

- **DinoGame** extends **FlameGame** class with **TapDetector**, **HasCollisionDetection** mixins which allows this class to perform taps and collision detection.
- In **GameOverlay** widget I have taken a **GameWidget** in which I passed a Object of **DinoGame**

- **Dino** is a class for Dino which contains method for animation,speed,jump,update and etc.
- **Enemy** class works same as dino class but for the enemies.Which is managed by **EnemyManager** class.
- **DinoGame** class manages all components of game either it is enemy or dino.

# Reference
-  [Flame Docs 1.6.0](https://docs.flame-engine.org/1.6.0/ "Flame Docs 1.6.0")

# Preview
[![Preview](https://bitbucket.org/rutu31/dinogame/raw/262e7759492c858598603c10efa68c7327de3046/screenshot/preview_ss.png "Preview")](https://bitbucket.org/rutu31/dinogame/raw/262e7759492c858598603c10efa68c7327de3046/screenshot/preview_ss.png "Preview")
# Created By
- Rutu Hirapara

