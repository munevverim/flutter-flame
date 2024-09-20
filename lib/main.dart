import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:gameflapybird/components/background_component.dart';
import 'package:gameflapybird/components/ground_component.dart';
import 'package:gameflapybird/components/player_component.dart';

void main() {
  runApp( GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with HasCollisionDetection  {
  @override
  FutureOr<void> onLoad() {
    add(BackgroundComponent());
    add(GroundComponent());
    add(PlayerComponent());
    return super.onLoad();
  }

}


