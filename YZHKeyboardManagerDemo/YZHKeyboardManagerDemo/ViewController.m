//
//  ViewController.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/8/20.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHKeyboardManager.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/* <#注释#> */
@property (nonatomic, strong) UITextField *textField;

/* <#注释#> */
@property (nonatomic, strong) UITextView *textView;

/* <#注释#> */
@property (nonatomic, strong) YZHKeyboardManager *keyboardManager;

/* <#注释#> */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self _test1];
    
    [self _test2];
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
    self.keyboardManager.keyboardShiftToMinTop = YES;
}

-(void)_test2
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH,500) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = RED_COLOR;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSSTRING_FROM_CLASS(TableViewCell)];
    [self.view addSubview:self.tableView];
    
    self.keyboardManager = [[YZHKeyboardManager alloc] init];
    self.keyboardManager.keyboardMinTopToResponder = 0;
    self.keyboardManager.keyboardShiftToMinTop = YES;
    WEAK_SELF(weakSelf);
    self.keyboardManager.becomeFirstResponderBlock = ^(YZHKeyboardManager *keyboardManager, NSNotification *notification) {
        UIView *firstResponderView = notification.object;
        keyboardManager.firstResponderView = firstResponderView.cell;
    };
    self.keyboardManager.resignFirstResponderBlock = ^(YZHKeyboardManager *keyboardManager, NSNotification *notification) {

    };

    self.keyboardManager.shiftBlock = ^(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification, CGFloat currentShift, BOOL isShow) {
        CGPoint contentOffset = weakSelf.tableView.contentOffset;
        CGFloat offsetY = contentOffset.y - currentShift;
        offsetY = MAX(offsetY, 0);
        CGFloat maxOffsetY = weakSelf.tableView.contentSize.height - weakSelf.tableView.bounds.size.height;
        if (isShow) {
            [weakSelf.tableView setContentOffset:CGPointMake(contentOffset.x, offsetY)];
        }
        else {
            if (contentOffset.y > maxOffsetY) {
                [weakSelf.tableView setContentOffset:CGPointMake(contentOffset.x, maxOffsetY)];
            }
        }
    };
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSSTRING_FROM_CLASS(TableViewCell) forIndexPath:indexPath];
    cell.textField.placeholder = NEW_STRING_WITH_FORMAT(@"%ld",indexPath.row + 1);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
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
