//
//  UIAlertTool.m
//  RXLabel
//
//  Created by srx on 16/4/19.
//  Copyright © 2016年 GHS. All rights reserved.
//

#import "UIAlertTool.h"


#define iOS8OrLater ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


//判断字符是否为空
BOOL IsStringWithAnyText(id object);
BOOL IsStringWithAnyText(id object) {
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0;
}

@interface UIAlertTool()

@end

@implementation UIAlertTool

- (void)showAlertView:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle {
    
    if (iOS8OrLater) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        if(IsStringWithAnyText(cancelButtonTitle)) {
            // Create the actions.
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                NSLog(@"你点击了取消");
            }];
            // Add the actions.
            [alertController addAction:cancelAction];
        }
        
        if(IsStringWithAnyText(otherButtonTitle)) {
            // Create the actions.
            UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                NSLog(@"你点击了确定");
            }];
            
            // Add the actions.
            [alertController addAction:otherAction];
        }
        [viewController presentViewController:alertController animated:YES completion:nil];
        
    }
    else{
        UIAlertView *Alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitle, nil];
        [Alert show];

    }
    
}

@end
