//
//  ViewController.h
//  viewControlTest
//
//  Created by 侯 坤明 on 13-4-6.
//  Copyright (c) 2013年 kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "blueView.h"
#import "yellowView.h"

@interface ViewController : UIViewController{
    yellowView *yellow;
    blueView *blue;
    IBOutlet UIView *homeView;
    IBOutlet UIView *view2;
}
@property (retain, nonatomic) IBOutlet UIView *homeView;
@property (retain,nonatomic) IBOutlet UIView *view2;
@property (retain, nonatomic) yellowView *yellow;
@property (retain,nonatomic) blueView *blue;
- (IBAction)goHome:(id)sender;
- (IBAction)goYellow:(id)sender;
- (IBAction)goBlue:(id)sender;

@end
