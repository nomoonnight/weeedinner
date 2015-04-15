//
//  MeViewController
//  DC
//
//  Created by vincent ding on 15/3/28.
//  Copyright (c) 2015年 vincent ding. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController


@synthesize button1;
@synthesize button2;
@synthesize button3;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
