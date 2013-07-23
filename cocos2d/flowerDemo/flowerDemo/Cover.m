//
//  Cover.m
//  flowerDemo
//
//  Created by 侯 坤明 on 13-6-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Cover.h"
#import "MainScene.h"


@implementation Cover
+(CCScene *)scene{
    CCScene *scene = [CCScene node];
    Cover *cover = [Cover node];
    [scene addChild:cover];
    return scene;
}
-(void)onEnter{
    [super onEnter];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *bg = [CCSprite spriteWithFile:@"flower_bd.jpg"];
    bg.position = ccp(size.width/2, size.height/2);
    [self addChild:bg];
    CCLabelTTF *text = [CCLabelTTF labelWithString:@"Flower Demo" fontName:@"Marker Felt"  fontSize:40];
    text.position = ccp(size.width/2, size.height/2);
    text.color = ccc3(255, 0, 0);
    [self addChild:text];
    
    [self scheduleOnce:@selector(enter) delay:1];
}
-(void)enter{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1 scene:[MainScene scene] withColor:ccWHITE]];
}

@end
