import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'overlays/start_game/screen_start_game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    refreshRate();
    super.initState();
  }

  /// It set the max fps to 60.
  refreshRate() async {
    await FlutterDisplayMode.setLowRefreshRate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: "PressStart2P",
            scaffoldBackgroundColor: Colors.black),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenStartGame());
  }
}
