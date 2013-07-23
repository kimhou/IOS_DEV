//
//  MovieDetailViewController.h
//  navigation controler demo
//
//  Created by 侯 坤明 on 13-5-26.
//  Copyright (c) 2013年 kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UITableViewController
@property (retain, nonatomic) IBOutlet UILabel *detailLabel;
@property (copy, nonatomic) NSString *message;

@end
