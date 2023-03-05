import 'package:flutter/material.dart';

import '../game_overlay.dart';

class ScreenStartGame extends StatelessWidget {
  const ScreenStartGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          height: 200,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "DINO RUN",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const GameOverlay();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 140,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.yellow),
                  child: const Text(
                    "Play",
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
