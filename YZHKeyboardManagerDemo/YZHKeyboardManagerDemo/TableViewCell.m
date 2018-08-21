//
//  TableViewCell.m
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/8/21.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "TableViewCell.h"
#import <objc/runtime.h>

@implementation UIView (UITableViewCell)

-(void)setCell:(UITableViewCell *)cell
{
    WEAK_NSOBJ(cell, weakCell);
    id (^block)() = ^{return weakCell;};
    objc_setAssociatedObject(self, @selector(cell), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    objc_setAssociatedObject(self, @selector(cell), cell, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableViewCell*)cell
{
    id (^block)() = objc_getAssociatedObject(self, _cmd);
    UITableViewCell *cellObj = (block ? block() : nil);
    return cellObj;
//    return objc_getAssociatedObject(self, _cmd);
}

@end

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _setupChildView];
    }
    return self;
}

-(void)_setupChildView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    CGFloat w = SCREEN_WIDTH - 100;
    CGFloat h = 60;
    CGFloat x = 50;
    CGFloat y = (80 - h)/2;
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(x, y, w, h)];
    self.textField.backgroundColor = PURPLE_COLOR;
    self.textField.placeholder = @"请输入电话";
    [self.contentView addSubview:self.textField];
    self.textField.cell = self;
}

-(void)dealloc
{
    NSLog(@"cell======dealloc");
}

@end
