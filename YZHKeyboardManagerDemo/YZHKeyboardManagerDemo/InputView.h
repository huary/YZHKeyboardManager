//
//  InputView.h
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/9/1.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZHKeyboardInputView.h"

@class InputView;
//@protocol InputViewDelegate <NSObject>
//
//-(void)inputView:(InputView*)inputView didChangeFrame:(CGRect)frame;
//@end

typedef void(^InputViewChangeFrameBlock)(InputView *inputView,CGRect frame);

@interface InputView : UIView<YZHKeyboardInputViewProtocol>

/* <#注释#> */
@property (nonatomic, strong) YZHUITextView *inputTextView;

/* <#注释#> */
@property (nonatomic, strong) UIView *firstResponderView;

/* <#注释#> */
@property (nonatomic, strong) UIView *contentView;



/* <#注释#> */
@property (nonatomic, copy) InputViewChangeFrameBlock changeFrameBlock;

@end
