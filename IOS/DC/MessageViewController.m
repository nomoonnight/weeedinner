//
//  FirstViewController.m
//  DC
//
//  Created by vincent ding on 15/3/28.
//  Copyright (c) 2015年 vincent ding. All rights reserved.
//

#import "MessageViewController.h"
#import "MBProgressHUD.h"
#import "UIView+RelativityLaws.h"
#import "ChatViewController.h"
#import "Functions.h"


@interface MessageViewController ()

@end

@implementation MessageViewController
@synthesize scrollview;

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"mySegueChat"]){
        ChatViewController *vc = [segue destinationViewController];
        
        //[vc setProductName:temp];

    }
}

-(void)singleTap:(UITapGestureRecognizer*)sender
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (IBAction) titleTap:(id) sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIButton *titleLabel = [UIButton buttonWithType:UIButtonTypeCustom];
    [titleLabel setTitle:NSLocalizedString(@"消息", nil) forState:UIControlStateNormal];
    titleLabel.frame = CGRectMake(0, 0, 70, 44);
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [titleLabel addTarget:self action:@selector(titleTap:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleLabel;
    
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    UITapGestureRecognizer *HUDSingleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap:)];
    [HUD addGestureRecognizer:HUDSingleTap];
    
    NSMutableArray * datas = [NSMutableArray arrayWithObjects:@"", nil];
    
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString * url1 = [NSString stringWithFormat:@"%@%@", @"http://www.maomao.de/service_app/get_news.php?language=", language];
    
    NSURL *JarltechProductURL1 = [NSURL URLWithString:url1];
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        JarltechProductURL1];
        
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) fetchedData:(NSData *) responseData{
    
    NSError* error;
    NSDictionary* json1 = [NSJSONSerialization JSONObjectWithData:responseData
                                                          options:kNilOptions
                                                            error:&error];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSArray* produkte = [json1 objectForKey:@"produkt"];
    produkt = [produkte objectAtIndex:0];
    NSMutableArray * news = [produkt objectForKey:@"news"];
    [self renderNews:news];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:@"myAlreadyReadNews"];
    
}

/*

-(void) callProduct:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    [self performSegueWithIdentifier:@"mySegueChat"  sender:self];
    
    
    for(int i=0; i<20; i++) {
        if (i== btn.tag - 170100){
            //NSMutableArray * news = [produkt objectForKey:@"news"];
            //NSDictionary * oneNews = [news objectAtIndex:i];
            //NSString * product_id = [oneNews objectForKey:@"item"];
            
            if (![product_id isEqual:@""]){
                //temp = product_id;
                
                [self performSegueWithIdentifier:@"mySegueChat"  sender:self];
                
            }
        }
    }
}*/

-(void)  renderNews:(NSMutableArray *) news_liste{
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 15, scrollview.frame.size.width, 75)];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray * array = [defaults objectForKey:@"myAlreadyReadNews"];
    
    for(int i=0; i<[news_liste count]; i++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 15, scrollview.frame.size.width, 75)];
        view.tag = 150000 + i;
        
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0.0f, 0.0f, view.frame.size.width, 1.0f);
        bottomBorder.backgroundColor = [UIColor colorWithWhite:0.8f
                                                         alpha:1.0f].CGColor;
        
        [view.layer addSublayer:bottomBorder];
        
        NSDictionary *object = [news_liste objectAtIndex: i];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(90, 0, scrollview.frame.size.width - 65, 60)];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        UILabel * labelOnButton1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, scrollview.frame.size.width -65, 13)];
        UILabel * labelOnButton2 = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, scrollview.frame.size.width -65 , 37)];
        UILabel * labelOnButton3 = [[UILabel alloc] initWithFrame:CGRectMake(scrollview.frame.size.width - 40, 15, 60, 13)];
        
        const char *c = [[object objectForKey:@"date"] cStringUsingEncoding:NSISOLatin1StringEncoding];
        labelOnButton1.text   = [[NSString alloc] initWithCString:c encoding:NSUTF8StringEncoding];
        
        const char *t2 = [[object objectForKey:@"text"] cStringUsingEncoding:NSISOLatin1StringEncoding];
        labelOnButton2.text   = [[NSString alloc] initWithCString:t2 encoding:NSUTF8StringEncoding];
     
        const char *t3 = [[object objectForKey:@"datum"] cStringUsingEncoding:NSISOLatin1StringEncoding];
        labelOnButton3.text   = [[NSString alloc] initWithCString:t3 encoding:NSUTF8StringEncoding];
     
        labelOnButton2.numberOfLines = 0;
        [labelOnButton1 setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
        
        labelOnButton1.textColor = [UIColor blackColor];
        labelOnButton2.textColor = [UIColor grayColor];
        labelOnButton3.textColor = [UIColor grayColor];
        
        [button.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
        [labelOnButton2 setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
        [labelOnButton3 setFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
        
        button.tag = 160000 + i;
        labelOnButton2.tag = 168000 + i;
        button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        [button addTarget:self action:@selector(expandDesc:)
         forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *temp_label =[[UILabel alloc] initWithFrame:CGRectMake(90, 54, scrollview.frame.size.width -60 , 0)];
        temp_label.tag = 170000 + i;
        [temp_label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        
        temp_label.text = [Functions decodeHTMLEntities:[object objectForKey:@"news"]];
        temp_label.textColor = [UIColor blackColor];
        temp_label.numberOfLines = 0;
        
        UIButton *temp_button = [[UIButton alloc] initWithFrame:CGRectMake(90, 54, scrollview.frame.size.width -60, 0)];
        temp_button.tag = 170100 + i;
        temp_button.titleLabel.text = @"";
        [temp_button addTarget:self action:@selector(callProduct:)
              forControlEvents:UIControlEventTouchUpInside];

        temp_label.hidden = YES;
        
        UIImageView *image =[[UIImageView alloc] initWithFrame:CGRectMake(10, 8, 60, 60)];
        image.tag = 190000 + i;
        NSData *bild = [NSData dataWithContentsOfURL:[NSURL URLWithString:[object objectForKey:@"bild"]]];
        image.image = [[UIImage alloc] initWithData:bild];
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [view addSubview:labelOnButton2];
        [view addSubview:labelOnButton1];
        [view addSubview:labelOnButton3];
        [view addSubview:button];
        [view addSubview:temp_label];
        [view addSubview:image];
        
        CGRect frame2 = view2.frame;
        frame2.size.height = 75; //temp.frame.size.height + 70;
        
        if (i==0){
            frame2.origin.y = 64;
        }else{
            frame2.origin.y = view2.frame.size.height + view2.frame.origin.y ;
        }
        view.frame = frame2;
        view2 = view;
        [scrollview addSubview:view];
    }
    
    [scrollview setContentSize:(CGSizeMake(320, view2.frame.size.height + view2.frame.origin.y))];
}



-(void) expandDesc:(id)sender{
    int y = scrollview.contentOffset.y;
    UIButton *btn = (UIButton *)sender;  // 160000
    
    UIView *tempview = (UIView *)[self.view viewWithTag:150000];
    bool already_expand = false;
    
    NSArray * subviews = [scrollview subviews];
    int count = [subviews count];
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    
    [self performSegueWithIdentifier:@"mySegueChat"  sender:self];
    
    /*
    for(int i=0; i<20; i++) {
        UIView *view = (UIView *)[self.view viewWithTag:150000 + i];
        
        if (i== btn.tag - 160000){
             [self performSegueWithIdentifier:@"mySegueChat"  sender:self];
        }
        
    }*/
}



@end



