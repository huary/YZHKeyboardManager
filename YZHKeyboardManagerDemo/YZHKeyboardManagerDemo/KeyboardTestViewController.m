//
//  KeyboardTestViewController.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/9/1.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "KeyboardTestViewController.h"
#import "YZHKeyboardManager.h"
#import "TableViewCell.h"


@interface KeyboardTestViewController ()<UITableViewDelegate,UITableViewDataSource>

/* <#注释#> */
@property (nonatomic, strong) YZHKeyboardManager *keyboardManager;

/* <#注释#> */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation KeyboardTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _test2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_test2
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = RED_COLOR;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSSTRING_FROM_CLASS(TableViewCell)];
    [self.view addSubview:self.tableView];
    
    self.keyboardManager = [[YZHKeyboardManager alloc] init];
    self.keyboardManager.keyboardMinTopToResponder = 0;
    self.keyboardManager.firstResponderShiftToKeyboardMinTop = YES;
    self.keyboardManager.relatedShiftView = self.tableView;
    self.keyboardManager.becomeFirstResponderBlock = ^(YZHKeyboardManager *keyboardManager, NSNotification *notification) {
        UIView *firstResponderView = notification.object;
        keyboardManager.firstResponderView = firstResponderView.cell;
    };
    self.keyboardManager.resignFirstResponderBlock = ^(YZHKeyboardManager *keyboardManager, NSNotification *notification) {
        
    };
    
//    WEAK_SELF(weakSelf);
//    self.keyboardManager.shiftBlock = ^(YZHKeyboardManager *keyboardManager, NSNotification *keyboardNotification, CGFloat currentShift, BOOL isShow) {
//        CGPoint contentOffset = weakSelf.tableView.contentOffset;
//        CGFloat offsetY = contentOffset.y - currentShift;
//        offsetY = MAX(offsetY, 0);
//        CGFloat maxOffsetY = weakSelf.tableView.contentSize.height - weakSelf.tableView.bounds.size.height;
//        if (isShow) {
//            [weakSelf.tableView setContentOffset:CGPointMake(contentOffset.x, offsetY)];
//        }
//        else {
//            if (contentOffset.y > maxOffsetY) {
//                [weakSelf.tableView setContentOffset:CGPointMake(contentOffset.x, maxOffsetY)];
//            }
//        }
//    };
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

@end
