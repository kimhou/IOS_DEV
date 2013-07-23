//
//  MainScene.m
//  flowerDemo
//
//  Created by 侯 坤明 on 13-6-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene
+(CCScene *) scene{
    CCScene *scene = [CCScene node];
    MainScene *layer = [MainScene node];
    [scene addChild:layer];
    return scene;
}
-(id)init{
    [super init];
    clickTime = 0;
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    [self addChild:[self addImg:@"flower_bd.jpg" :size.width/2 :size.height/2 :1] z:0];
    [self addChild:[self addImg:@"flower_all.png" :142 :200 :0.78] z:1];
    
    id *snow = [self createSnow];
    [self addChild:snow z:3];
    
    CCParticleFlower *flowerE = [self createFlowerEfect:@"icon_star.png" :size.width/2 + 90 :size.height/2 - 150];
    curEffect = flowerE;
    [self addChild:flowerE z:4];
    CCParticleFireworks *firework = [self createMeteor:@"icon_star.png" :size.width/2 + 90 :-10];
    hideEffect = firework;
    firework.visible = NO;
    [self addChild:hideEffect z: 5];
    self.isTouchEnabled = YES;
    return self;
}
-(CCSprite *)addImg:(NSString *) src :(float) x :(float) y :(float)scale{
    
    CCSprite *sp = [CCSprite spriteWithFile:src];
    sp.position = ccp(x, y);
    sp.scale = scale;
    return sp;
}

-(CCParticleRain *)createRain{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCParticleRain *snow = [[CCParticleRain alloc] init];
    // snow.scale = 0.3;
    [snow setTexture:[[CCTextureCache sharedTextureCache] addImage:@"icon_snow.png"]];
    snow.position = ccp(size.width/2, size.height);
    snow.life = 12;
    snow.speed = 8;
    snow.speedVar = 10;
    return snow;
}

-(id *)createSnow{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCParticleSnow *snow = [[CCParticleSnow alloc] init];
   // snow.scale = 0.3;
    [snow setTexture:[[CCTextureCache sharedTextureCache] addImage:@"icon_snow.png"]];
    snow.position = ccp(size.width/2, size.height);
    snow.life = 12;
    snow.speed = 20;
    snow.speedVar = 50;
    return snow;
}
-(CCParticleFireworks *)createMeteor:(NSString *) src: (float)x:(float)y{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCParticleFireworks *efect = [[CCParticleFireworks alloc] init];
    [efect setTexture:[[CCTextureCache sharedTextureCache] addImage:src]];
    efect.position = ccp(x, y);
    efect.autoRemoveOnFinish = YES;
    return efect;
}
-(CCParticleFlower *)createFlowerEfect: (NSString *) src: (float)x:(float)y{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCParticleFlower *efect = [[CCParticleFlower alloc] init];
    [efect setTexture:[[CCTextureCache sharedTextureCache] addImage:src]];
    efect.position = ccp(x, y);
    efect.autoRemoveOnFinish = YES;
    return efect;
}
-(void) registerWithTouchDispatcher{
    [[CCTouchDispatcher sharedDispatcher]addTargetedDelegate:self priority:0 swallowsTouches:YES];
}
-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    NSLog(@"touch began");
    return YES;
}

//触摸事件
-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    if(clickTime == 0){
        clickTime = 1;
        [curEffect stopSystem];
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCParticleFlower *flowerE = [self createFlowerEfect:@"icon_star.png" :size.width/2 + 90 :size.height/2 - 150];
        curEffect = flowerE;
        [self addChild:flowerE z:4];
    }else{
        clickTime = 0;
        [curEffect stopSystem];
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCParticleFireworks *flowerE = [self createMeteor:@"icon_star.png" :size.width/2 + 90 :0];
        curEffect = flowerE;
        [self addChild:flowerE z:4];

    }
    
}


@end
