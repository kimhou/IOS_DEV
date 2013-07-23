//
//  HelloWorldLayer.m
//  cocos2dHelloworld
//
//  Created by 侯 坤明 on 13-5-30.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super initWithColor:ccc4(255, 255, 0, 255)]) ) {
		CGSize winsize = [CCDirector sharedDirector].winSize;
        CCSprite *bg = [CCSprite spriteWithFile:@"bg2.jpg"];
        bg.position = ccp(winsize.width/2, winsize.height/2);
       [self addChild:bg];
		[self schedule:@selector(gameTimer:)interval:1];
        //[self addPop];
        
	}
	return self;
}
-(void) addPop{
    CCSprite *pop = [CCSprite spriteWithFile:@"pop.png"];
    srand(time(nil));
    pop.scale = 0.2;
    pop.opacity = arc4random() % 50 + 50;
    CGSize winSize = [CCDirector sharedDirector].winSize;
    int minY = 0;//pop.contentSize.height/2 * pop.scale;
    int maxY = winSize.height - minY;
    int rangeY = maxY - minY;
    int y = (arc4random() % rangeY) -maxY;//+ minY;
    int minX = pop.contentSize.width/2 * pop.scale;
    int maxX = winSize.width - minX;
    int rangeX = maxX - minX;
    int x = (arc4random() % rangeX) + minX;
    
    NSLog(@"%d,%d,%f", x, y, rand());
    pop.position = ccp(x, y);
    [self addChild:pop];
    
    int minDuration = 2;
    int maxDuration = 4;
    int rangeDuration = maxDuration - minDuration;
    int duration = (arc4random() % rangeDuration) + minDuration;
    CCMoveTo *actionMove = [CCMoveTo actionWithDuration:5 position:ccp(x,400)];
    CCCallBlockN *actionMoveDone = [CCCallBlockN actionWithBlock:^(CCNode *node){
        [node removeFromParentAndCleanup:YES];
    }];
    [pop runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}
-(void)gameTimer:(ccTime)dt{
    [self addPop];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
