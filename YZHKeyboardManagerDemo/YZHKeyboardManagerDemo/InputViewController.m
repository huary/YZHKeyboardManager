//
//  InputViewController.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/9/1.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "InputViewController.h"
#import "YZHKeyboardInputView.h"
#import "InputView.h"

@interface InputViewController ()

/*  */
@property (nonatomic, strong) YZHKeyboardInputView *keyboardInputView;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupChildView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)_setupChildView
{
    self.view.backgroundColor = WHITE_COLOR;
    
    CGFloat x = 0;
    CGFloat h = 300;
    CGFloat y = SCREEN_HEIGHT - 60 - SAFE_BOTTOM;
    CGFloat w = SCREEN_WIDTH;
    
    WEAK_SELF(weakSelf);
    InputView *inputView = [[InputView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    
    inputView.changeFrameBlock = ^(InputView *inputView, CGRect frame) {
        [weakSelf _changeInputViewFrame:inputView];
    };
    self.keyboardInputView = [[YZHKeyboardInputView alloc] initWithInputView:inputView];
    [self.view addSubview:inputView];
    
    x = 100;
    y = 100;
    w = SCREEN_WIDTH/2;
    h = 40;
    UIButton *btn = [self _createButton:@"becomeFirstResponder" frame:CGRectMake(x, y, w, h)];
    self.keyboardInputView.relatedShiftView = btn;
    self.keyboardInputView.firstResponderView = btn;
 }

-(UIButton*)_createButton:(NSString*)title frame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = PURPLE_COLOR;
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(_action:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)_action:(NSInteger)tag
{
    [self.keyboardInputView becomeFirstResponder];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.keyboardInputView resignFirstResponder];
}

-(void)_changeInputViewFrame:(InputView*)inputView
{
    [self.keyboardInputView updateKeyboardInputView:inputView];
}


@end
