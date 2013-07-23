//
//  ViewController.m
//  UI_demo_2
//
//  Created by 侯 坤明 on 12-11-24.
//  Copyright (c) 2012年 kim. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

@synthesize nameField;
@synthesize pwdField;
@synthesize mobileField;
@synthesize loginBtn;
@synthesize resultField;
@synthesize segControl;
@synthesize switch1;
@synthesize switch2;
@synthesize slider;

- (IBAction)loginClick
{
    resultField.text = @"teefetet";
    [resultField setText: [NSString stringWithFormat: @"result is:\n name: %@,\npassworld: %@ \n ", nameField.text, pwdField.text]];
}
- (IBAction)selectChange{
    [resultField insertText:[NSString stringWithFormat:@"%d",[segControl selectedSegmentIndex]]];
}

- (IBAction)switchChange: (id)sender{
    BOOL isOn = [(UISwitch *)sender isOn];
    [switch1 setOn:isOn animated:YES];
    [switch2 setOn:isOn animated:YES];
}

-(IBAction)slideChange{
    [resultField insertText:[NSString stringWithFormat:@"slide is:%d", (int)(slider.value + 0.5f)]];
}

-(IBAction)textFieldDone:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTouch{
    [nameField resignFirstResponder];
    [pwdField resignFirstResponder];
    [mobileField resignFirstResponder];
}


-(IBAction)showSheet{
    UIActionSheet *sheet = [[UIActionSheet alloc]
                            initWithTitle:@"do you like?"
                            delegate:self
                            cancelButtonTitle:@"no"
                            destructiveButtonTitle:@"yes"
                            otherButtonTitles:@"other1",
                            nil];
    [sheet showInView:self.view];
    [sheet release];
}

-(void)actionSheet:(UIActionSheet *) actionSheet clickedButtonAtIndex:(int)index{
    NSLog(@"%d", index);
}

-(IBAction)showAlert{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"title"
                          message:@"msg"
                          delegate:self
                          cancelButtonTitle:@"no"
                          otherButtonTitles:@"other",
                          nil];
    [alert show];
    [alert release];
}
-(void)actionAlert:(UIAlertView *) actionAlert clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"ddd%d", buttonIndex);
}

-(void)dealloc{
    [nameField release];
    [pwdField release];
    [loginBtn release];
    [resultField release];
    [mobileField release];
    [segControl release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [segControl removeAllSegments];
    [segControl insertSegmentWithTitle:@"aaa" atIndex:0 animated:YES];
    [segControl insertSegmentWithTitle:@"BBB" atIndex:1 animated:YES];
        [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
