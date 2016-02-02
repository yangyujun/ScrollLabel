//
//  ViewController.m
//  ScrollLabel
//
//  Created by yyj on 16/2/2.
//  Copyright © 2016年 yyj. All rights reserved.
//

#import "ViewController.h"
#import "NewNoticeView.h"

@interface ViewController ()
@end

@implementation ViewController

static int countInt=0;
static NSString *notice_index;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NewNoticeView *noticeView = [[NewNoticeView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 65 )];
    noticeView.noticeList = @[@"公告公告1",@"公告公告2",@"公告公告3"];
    noticeView.awardList = @[@"花花 抽中iphone6s",@"小书包 抽中iphone6s",@"媚儿 抽中iphone6s"];
    [self.view addSubview:noticeView];
}

@end

