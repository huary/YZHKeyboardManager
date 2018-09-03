//
//  ViewController.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/8/20.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHKeyboardManager.h"
#import "InputViewController.h"
#import "KeyboardTestViewController.h"

@interface ViewController ()

/* <#注释#> */
@property (nonatomic, strong) UITextField *textField;

/* <#注释#> */
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) YZHKeyboardManager *keyboardManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self _test1];
    
    [self _setupChildView];
}

-(void)_test1
{
    UIView *contentView = [UIView new];
    contentView.frame = CGRectMake(0, 100, SCREEN_WIDTH, 500);
    contentView.backgroundColor = PURPLE_COLOR;
    [self.view addSubview:contentView];
    
    CGFloat w = SCREEN_WIDTH * 0.5;
    CGFloat h = 40;
    CGFloat x = (SCREEN_WIDTH - w)/2;
    CGFloat y = 200;
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"textField";
    self.textField.backgroundColor = GROUP_TABLEVIEW_BG_COLOR;
    self.textField.frame = CGRectMake(x, y, w, h);
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    [contentView addSubview:self.textField];
    
    y = CGRectGetMaxY(self.textField.frame) + UI_HEIGHT(20);
    h = 200;
    self.textView = [[UITextView alloc] init];
    self.textView.backgroundColor = GROUP_TABLEVIEW_BG_COLOR;
    self.textView.frame = CGRectMake(x, y, w, h);
    [contentView addSubview:self.textView];
    
    self.keyboardManager = [[YZHKeyboardManager alloc] init];
    self.keyboardManager.firstResponderView = contentView;
    self.keyboardManager.relatedShiftView = contentView;
    self.keyboardManager.keyboardMinTopToResponder = 0;
    self.keyboardManager.firstResponderShiftToKeyboardMinTop = YES;
}

-(UIButton*)_createButtonWithTitle:(NSString*)title frame:(CGRect)frame tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.tag = tag;
    button.backgroundColor = PURPLE_COLOR;
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(_action:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)_action:(UIButton*)sender
{
    UIViewController *test = nil;
    if (sender.tag == 1) {
       test  = [[KeyboardTestViewController alloc] init];
    }
    else {
        test = [[InputViewController alloc] init];
    }
    [self presentViewController:test animated:YES completion:nil];
}

-(void)_setupChildView
{
    CGFloat w = 500;
    CGFloat h = 80;
    CGFloat x = (SCREEN_WIDTH - w)/2;
    CGFloat y = 100;
    [self _createButtonWithTitle:@"keyboardTest" frame:CGRectMake(x, y, w, h) tag:1];
    
    y = 200;
    [self _createButtonWithTitle:@"inputTest" frame:CGRectMake(x, y, w, h) tag:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
