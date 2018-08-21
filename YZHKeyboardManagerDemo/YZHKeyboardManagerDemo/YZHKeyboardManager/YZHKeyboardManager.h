//
//  YZHKeyboardManager.h
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/8/20.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@class YZHKeyboardManager;
typedef void(^YZHKeyboardWillShowBlock)(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification);
typedef void(^YZHKeyboardWillHideBlock)(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification);
typedef void(^YZHKeyboardWillUpdateBlock)(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification, BOOL isShow);
typedef void(^YZHKeyboardDidHideBlock)(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification);
typedef void(^YZHKeyboardDidShowBlock)(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification);



@interface YZHKeyboardManager : NSObject

@property (nonatomic, weak) UIView *relatedShiftView;

//既可以指定也可以不用指定，就是keyboard不要遮挡的view,默认会自动去获取
@property (nonatomic, weak) UIView *firstResponderView;
//指的是keyboard和firstResponder的最小距离,默认为0;
@property (nonatomic, assign) CGFloat keyboardMinTopToResponder;

@property (nonatomic, copy) YZHKeyboardWillShowBlock willShowBlock;
@property (nonatomic, copy) YZHKeyboardWillHideBlock willHideBlock;
@property (nonatomic, copy) YZHKeyboardWillUpdateBlock willUpdateBlock;
@property (nonatomic, copy) YZHKeyboardDidShowBlock didShowBlock;
@property (nonatomic, copy) YZHKeyboardDidHideBlock didHideBlock;

@end


/*****************************************************************************
 *YZHShareKeyboardManager
 *****************************************************************************/
@interface YZHShareKeyboardManager : NSObject

@property (nonatomic, strong, readonly) YZHKeyboardManager *keyboardManager;

+(instancetype)shareKeyboardManager;

@end
