//
//  InputView.h
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/9/1.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZHKeyboardInputView.h"

@interface InputView : UIView<YZHKeyboardInputViewProtocol>

/* <#注释#> */
@property (nonatomic, strong) YZHUITextView *inputTextView;

/* <#注释#> */
@property (nonatomic, strong) UIView *firstResponderView;

/* <#注释#> */
@property (nonatomic, strong) UIView *contentView;

@end
