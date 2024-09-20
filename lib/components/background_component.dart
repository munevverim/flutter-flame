import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'dart:async';
class BackgroundComponent extends ParallaxComponent{
  BackgroundComponent();
  @override
 FutureOr<void> onLoad() async {
  parallax=await game.loadParallax([
    ParallaxImageData('background.png')
  ],
  baseVelocity: Vector2(10, 0)
  );
  return super.onLoad();
 }

}