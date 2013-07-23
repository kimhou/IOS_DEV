//
//  MainScene.h
//  flowerDemo
//
//  Created by 侯 坤明 on 13-6-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainScene : CCLayer {
@private id curEffect;
@private id hideEffect;
@private int clickTime;

}
+(CCScene *)scene;
@end
