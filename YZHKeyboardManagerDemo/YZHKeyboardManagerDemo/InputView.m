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
    CGFloat h = 40;
    CGFloat x = (SCREEN_WIDTH - w)/2;
    
    UIView *contentView = [UIView new];
    contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    contentView.backgroundColor = BROWN_COLOR;
    [self addSubview:contentView];
    
    CGFloat y = (contentView.frame.size.height - h)/2;
    
    YZHUITextView *inputTextView = [[YZHUITextView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    inputTextView.font = FONT(18);
    inputTextView.layer.cornerRadius = h/2;
    inputTextView.layer.masksToBounds = YES;
    inputTextView.backgroundColor = PURPLE_COLOR;
    
    [self addSubview:inputTextView];
    self.inputTextView = inputTextView;
    self.firstResponderView = contentView;
    self.contentView = self;
}


@end
