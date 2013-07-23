//
//  ViewController.h
//  UI_demo_2
//
//  Created by 侯 坤明 on 12-11-24.
//  Copyright (c) 2012年 kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UITextField *nameField;
    UITextField *pwdField;
    UITextField *mobileField;
    UIButton *loginBtn;
    UITextView *resultField;
    UISwitch *switch1;
    UISwitch *switch2;
    UISegmentedControl *segControl;
    UISlider *slider;
    
}
@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UITextField *pwdField;
@property (nonatomic, retain) IBOutlet UITextField *mobileField;
@property (nonatomic, retain) IBOutlet UIView *myview;
@property (nonatomic, retain) IBOutlet UIButton *loginBtn;
@property (nonatomic, retain) IBOutlet UITextView *resultField;
@property (nonatomic, retain) IBOutlet UISwitch *switch1;
@property (nonatomic, retain) IBOutlet UISwitch *switch2;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segControl;
@property (nonatomic, retain) IBOutlet UISlider *slider;
-(IBAction)loginClick;
-(IBAction)textFieldDone:(id)sender;

@end
