import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:gameflapybird/components/ground_component.dart';
import 'package:gameflapybird/utils/config.dart';

class PlayerComponent extends SpriteAnimationComponent with HasGameReference,CollisionCallbacks {
  PlayerComponent():super(){
    debugMode=true;

  }
  var velocityBird=0.0;


  @override
  Future<void> onLoad() async {
    List<Sprite> spriteList=[
      await Sprite.load('yellowbird-downflap.png'),
      await Sprite.load('yellowbird-midflap.png'),
      await Sprite.load('yellowbird-upflap.png'),
    ];
    final anim=SpriteAnimation.spriteList(spriteList, stepTime: 0.15);
    size=Vector2(34, 26);
    position=Vector2(70,game.size.y/2);
    animation=anim;
    add(CircleHitbox());
    
    return super.onLoad();
  }
  @override
  void update(double dt){
    addGravity(dt);
    super.update(dt);
  }
  addGravity(double dt){
    velocityBird+=Config.gravity*dt;
    final newPosition=position.y+velocityBird*dt;
    

    position=Vector2(position.x, newPosition);
    anchor =Anchor.center;
    final anpha=clampDouble(velocityBird/180, -pi*0.25, pi*0.25);
    angle=anpha;

  }
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is GroundComponent){
      print('Ve ona dikkat et');
    }
    
    super.onCollisionStart(intersectionPoints, other);
  }




}