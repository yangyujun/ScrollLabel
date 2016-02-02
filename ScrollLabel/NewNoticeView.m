//
//  NewNoticeView.m
//  TwiceKaiJiang
//
//  Created by yyj on 16/2/2.
//  Copyright © 2016年 gxm. All rights reserved.
//

#import "NewNoticeView.h"
#import "Masonry.h"

@implementation NewNoticeView

static int countInt=0;

- (NSArray *)noticeList{
    
    if (!_noticeList) {
        _noticeList = [NSArray array];
    }
    return _noticeList;
}

- (NSArray *)awardList{
    
    if (!_awardList) {
        _awardList = [NSArray array];
    }
    return _awardList;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initContentView];
    }
    
    return self;
}

- (void)initContentView{
    UILabel *noticeLabel = [UILabel new];
    noticeLabel.text = @"最新公告";
    [self addSubview:noticeLabel];
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).with.offset(40);
        make.top.mas_equalTo(self.mas_top).with.offset(5);
        make.height.equalTo(@25);
    }];
    
    UILabel *awardLabel = [UILabel new];
    awardLabel.text = @"最新中奖";
    [self addSubview:awardLabel];
    [awardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).with.offset(40);
        make.top.mas_equalTo(noticeLabel.mas_bottom).with.offset(5);
        make.height.equalTo(@25);
    }];
    
    self.notice = [UILabel new];
    self.notice.font = [UIFont systemFontOfSize:15.0];
    self.notice.text = @"重视dfsdfsdfdsdf";
    self.notice.textColor = [UIColor lightGrayColor];
    [self addSubview:self.notice];
    
    self.award = [UILabel new];
    self.award.font = [UIFont systemFontOfSize:15.0];
    self.award.text = @"secondNotice新云重视的";
    self.award.textColor = [UIColor lightGrayColor];
    [self addSubview:self.award];
    
    [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
}

- (void)layoutSubviews{
    
    [self.notice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).with.offset(-10);
        make.top.mas_equalTo(self.mas_top).with.offset(5);
        make.height.equalTo(@25);
    }];
    [self.award mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).with.offset(-10);
        make.top.mas_equalTo(self.notice.mas_bottom).with.offset(5);
        make.height.equalTo(@25);
    }];
    
}

-(void)displayNews{
    countInt++;
 
    if (countInt >= [self.noticeList count])
        countInt=0;
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f ;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    animation.type = @"cube";
 
    [self.notice.layer addAnimation:animation forKey:@"animationID"];
    self.notice.text = self.noticeList[countInt];
    [self.award.layer addAnimation:animation forKey:@"animationID"];
    self.award.text = self.awardList[countInt];
}

@end
