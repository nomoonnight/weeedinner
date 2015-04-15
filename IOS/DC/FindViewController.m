//
//  FindViewController
//  DC
//
//  Created by vincent ding on 15/3/28.
//  Copyright (c) 2015年 vincent ding. All rights reserved.
//

#import "FindViewController.h"



@interface FindViewController ()

@end



@implementation FindViewController

@synthesize buttonFriendsCircle;
@synthesize buttonFindDinner;
@synthesize buttonShuttleFind;
@synthesize viewFindDinner;
@synthesize viewFriendsCircle;
@synthesize viewShuttleFind;
@synthesize viewMain;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    buttonFriendsCircle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    buttonFindDinner.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    buttonShuttleFind.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    
    CGRect frame = viewFindDinner.frame;
    frame.size.width = self.view.bounds.size.width; //viewMain.frame.size.width;
    viewFindDinner.frame = frame;

    viewFriendsCircle.frame = frame;

    viewShuttleFind.frame = frame;

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
