//
//  RXLabel.h
//  RXLabel
//
//  Created by srxboys on 16/3/6.
//  Copyright © 2016年 GHS. All rights reserved.
//
/// https://github.com/srxboys/RXLabel

#import <UIKit/UIKit.h>
@class RXLabel;
@protocol RXLabelDelegate <NSObject>
- (void)RXLabelGetClick:(RXLabel *)RXLabel;
@end

@interface RXLabel : UIView
@property (nonatomic, copy)   UIColor         * textColor; //字 颜色
@property (nonatomic, assign) UIFont          * font; //字体、大小
@property (nonatomic, assign) NSInteger         numOfLine; //行
@property (nonatomic, assign) NSTextAlignment   textAlignment;
@property (nonatomic, assign) NSInteger         lineSpacing;//行间距

@property (nonatomic, copy)   NSString        * text; //文本 //这个是最后赋值的
@property (nonatomic, assign) BOOL              isTopStart; //顶部对齐
@property (nonatomic, assign) BOOL              isAutoSize; //

@property (nonatomic, copy)   UIColor         * colorSelected;//选中颜色

@property (nonatomic, assign,readonly)CGFloat   unfurlHeight;//展开的高度
@property (nonatomic, assign, readonly)CGFloat  pinchedHeight; //收缩高度

@property (nonatomic, strong) id<RXLabelDelegate>delegete;
@end
