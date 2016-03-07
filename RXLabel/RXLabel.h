//
//  RXLabel.h
//  RXLabel
//
//  Created by srxboys on 16/3/6.
//  Copyright © 2016年 GHS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RXLabel;
@protocol RXLabelDelegate <NSObject>
- (void)RXLabelGetClick:(RXLabel *)RXLabel;
@end

@interface RXLabel : UIView
@property (nonatomic, copy)   UIColor   * color;     //字: 颜色
@property (nonatomic, assign) UIFont    * font;      //字: 字体、大小
@property (nonatomic, assign) NSInteger   numOfLine; //字: 行

@property (nonatomic, copy)   NSString  * txt; //字:文本
@property (nonatomic, assign) BOOL        isTopStart; //字:是否 顶部对齐

@property (nonatomic, copy)   UIColor   * colorSelected;//选中颜色

@property (nonatomic, strong) id<RXLabelDelegate>delegete;
@end
