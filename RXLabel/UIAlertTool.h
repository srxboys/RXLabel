//
//  UIAlertTool.h
//  RXLabel
//
//  Created by srx on 16/4/19.
//  Copyright © 2016年 GHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertTool : UIView
- (void)showAlertView:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;
@end

