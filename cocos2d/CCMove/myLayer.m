//
//  myLayer.m
//  CCMove
//
//  Created by 侯 坤明 on 13-6-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "myLayer.h"


@implementation myLayer
+(CCScene *) scene{
    CCScene *scene = [CCScene node];
    myLayer *layer = [myLayer node];
    [scene addChild:layer];
    return scene;
}
-(void) onEnter{
    [super onEnter];
    CGSize size = [[CCDirector sharedDirector] winSize];
    CCSprite *bg = [CCSprite spriteWithFile:@"Default.png"];
    bg.position = ccp(size.width/2, size.height/2);
    [self addChild:bg];
}

@end
