//
//  ModelController.h
//  pageBaseDemo
//
//  Created by 侯 坤明 on 13-4-9.
//  Copyright (c) 2013年 kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end
