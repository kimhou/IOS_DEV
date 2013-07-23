//
//  ViewController.m
//  viewControlTest
//
//  Created by 侯 坤明 on 13-4-6.
//  Copyright (c) 2013年 kim. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goHome:(id)sender {
    [self.view.superview insertSubview:self.view2 atIndex:0];
    [self.view.superview bringSubviewToFront:self.view2];
}

- (IBAction)goYellow:(id)sender {
    yellowView *yellowOne = [self getYellowView:sender];
    [self.view insertSubview:yellowOne.view atIndex:0];
}

- (IBAction)goBlue:(id)sender {
    blueView *blueOne = [self getBlueView:sender];
    [self.view insertSubview:blueOne.view atIndex:0];
    //[blueOne release];
}

-(yellowView *) getYellowView:(id)sender{
    NSLog(@"yellow");
    if(self.yellow == nil){
        yellowView *yellowOne = [[yellowView alloc] initWithNibName:@"yellowView" bundle:nil];
        self.yellow = yellowOne;
    }
    return(self.yellow);
}
-(blueView *)getBlueView:(id)sender{
    if(self.blue == nil){
        blueView *blueOne = [[blueView alloc] initWithNibName:@"blueView" bundle:nil];
        self.blue = blueOne;
    }
    return self.blue;
}
-(void) dealloc{
    [yellow release];
    [blue release];
    [homeView release];
    [view2 release];
    [super dealloc];
}
@end
