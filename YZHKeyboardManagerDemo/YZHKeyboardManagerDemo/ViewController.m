//
//  ViewController.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/8/20.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHKeyboardManager.h"

@interface ViewController ()

/* <#注释#> */
@property (nonatomic, strong) UITextField *textField;

/* <#注释#> */
@property (nonatomic, strong) UITextView *textView;

/* <#注释#> */
@property (nonatomic, strong) YZHKeyboardManager *keyboardManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupChildView];
}

-(void)_setupChildView
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
    [contentView addSubview:self.textField];
    
    y = CGRectGetMaxY(self.textField.frame) + UI_HEIGHT(20);
    h = 200;
    self.textView = [[UITextView alloc] init];
    self.textView.backgroundColor = GROUP_TABLEVIEW_BG_COLOR;
    self.textView.frame = CGRectMake(x, y, w, h);
    [contentView addSubview:self.textView];
    
    self.keyboardManager = [[YZHKeyboardManager alloc] init];
//    self.keyboardManager.firstResponderView = contentView;
//    self.keyboardManager.relatedShiftView = contentView;
//    self.keyboardManager.keyboardMinTopToResponder = 10;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
