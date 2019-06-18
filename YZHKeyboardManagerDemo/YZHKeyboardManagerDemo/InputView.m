//
//  InputView.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/9/1.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "InputView.h"

@implementation InputView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupChildView];
    }
    return self;
}

-(void)_setupChildView
{
    self.backgroundColor = RED_COLOR;
    CGFloat w = SCREEN_WIDTH * 0.8;
    CGFloat h = 60;
    CGFloat x = (SCREEN_WIDTH - w)/2;
    
    UIView *firstResponderView = [UIView new];
    firstResponderView.frame = CGRectMake(0, 0, SCREEN_WIDTH, h);
    firstResponderView.backgroundColor = BROWN_COLOR;
    [self addSubview:firstResponderView];
    
    CGFloat s = 10;
    CGFloat y = s;//(firstResponderView.frame.size.height - h)/2;
//    CGFloat h = 40;
    h =(h - 2 * s);
    
    YZHUITextView *inputTextView = [[YZHUITextView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    inputTextView.font = FONT(18);
    inputTextView.layer.cornerRadius = h/2;
    inputTextView.layer.masksToBounds = YES;
    inputTextView.backgroundColor = PURPLE_COLOR;
    inputTextView.maxLimit = [[YZHUITextViewLimit alloc] initWithLimitType:NSTextViewLimitTypeLines limitValue:@(5)];
    WEAK_SELF(weakSelf);
    inputTextView.changeFrameBlock = ^(YZHUITextView *textView, CGRect oldFrame, CGRect newFrame) {
        [weakSelf _changeFrameAction:oldFrame frame:newFrame];
    };
    
    [firstResponderView addSubview:inputTextView];
    
    self.inputTextView = inputTextView;
    self.firstResponderView = firstResponderView;
//    self.contentView = nil;
}

-(void)_changeFrameAction:(CGRect)oldFrame frame:(CGRect)frame
{
    CGFloat height = frame.size.height;
    
    CGFloat diff = height - oldFrame.size.height;
    
    CGRect f = self.firstResponderView.frame;
    f.size.height += diff;
    
    self.firstResponderView.frame = f;
    
    f = self.frame;
    f.size.height += diff;
    f.origin.y = f.origin.y - diff;
    self.frame = f;
    
    if (self.changeFrameBlock) {
        self.changeFrameBlock(self, f);
    }
}

@end
