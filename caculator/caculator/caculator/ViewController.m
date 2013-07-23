//
//  ViewController.m
//  caculator
//
//  Created by 侯 坤明 on 13-6-1.
//  Copyright (c) 2013年 kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize outPut = _outPut;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)numClick:(id)sender {
    NSString *digit = [sender currentTitle];
    NSString *nowStr = self.outPut.text;
    _outPut.text = [nowStr stringByAppendingString:digit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_outPut release];
    [super dealloc];
}
@end
