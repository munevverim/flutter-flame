


import 'package:flame/collisions.dart';
import 'package:gameflapybird/utils/config.dart';
import 'dart:async';
import 'package:flame/parallax.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:gameflapybird/components/background_component.dart';
import 'package:gameflapybird/utils/config.dart';

class GroundComponent extends ParallaxComponent with CollisionCallbacks {
  GroundComponent():super(){
    debugMode=true;
  }
  @override
 FutureOr<void> onLoad() async {
  parallax=await game.loadParallax([
    ParallaxImageData('base.png')
  ],
  baseVelocity: Vector2(Config.gameSpeed.toDouble(), 0),fill: LayerFill.none,alignment: Alignment.bottomLeft,
  );
  add(RectangleHitbox(
    position: Vector2(0, game.size.y=Config.heightGround.toDouble()),
    size: Vector2(game.size.x, Config.heightGround.toDouble()),
  ));
    return super.onLoad();
  }

}