//
//  TableViewCell.h
//  YZHKeyboardManagerDemo
//
//  Created by yuan on 2018/8/21.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UITableViewCell)

/* <#注释#> */
@property (nonatomic, weak) UITableViewCell *cell;

@end



@interface TableViewCell : UITableViewCell

/* <#注释#> */
@property (nonatomic, strong) UITextField *textField;

@end

