//
//  FirstViewController.h
//  DC
//
//  Created by vincent ding on 15/3/28.
//  Copyright (c) 2015年 vincent ding. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MessageViewController : UIViewController<UIWebViewDelegate>{
    NSDictionary* produkt;
    NSString *temp;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@end
