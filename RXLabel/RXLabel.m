//
//  RXLabel.m
//  RXLabel
//
//  Created by srxboys on 16/3/6.
//  Copyright © 2016年 GHS. All rights reserved.
//

#import "RXLabel.h"

@interface RXLabel ()
{
    //---------[GHSTalentHeadDescriptLabel的  frame的]----------
    CGFloat    _viewWidth;
    CGFloat    _viewHeight;
    CGFloat    _viewHighHeight;
    CGRect     _viewRect;
    BOOL       _isHightHeight;
    //---------------------------------------------------------
    
    UILabel  * _label;
    CGFloat    _labelHeight;
    UIButton * _backViewButton;
    
}
@end

@implementation RXLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = [UIColor clearColor];
        [self existsView];
        
        _isHightHeight = NO;
        
        _viewRect       = frame;
        _viewWidth      = frame.size.width;
        _viewHeight     = frame.size.height;
        _viewHighHeight = _viewHeight;
        _labelHeight    = _viewHeight;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        _label.text = @"";
        [self addSubview:_label];
        
        //点击按下的 背景颜色
        UIColor * colorAlpha = [UIColor colorWithRed:0.3988 green:0.4081 blue:0.3352 alpha:0.5f];
        
        _backViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backViewButton.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
        [_backViewButton setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [_backViewButton setBackgroundImage:[self createImageWithColor:colorAlpha] forState:UIControlStateHighlighted];
        [_backViewButton addTarget:self action:@selector(labelUPButtoInOutsider) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backViewButton];
        
        [self configDefauleValue];
    }
    return self;
}

/// 判断一些控件 是否存在
- (void)existsView {
    if(_label != nil) {
        _label = nil;
    }
    
    if(_backViewButton != nil) {
        _backViewButton = nil;
    }
    
}

#pragma mark - ~~~~~~~~~~~ 设置默认值 ~~~~~~~~~~~~~~~
/// 设置默认值
- (void)configDefauleValue {
    self.color     = [UIColor whiteColor];
    self.font      = [UIFont systemFontOfSize:14];
    self.numOfLine = 1;
    
    self.txt       = @"";
}

#pragma mark - ~~~~~~~~~~~ 赋值 setter 重新 ~~~~~~~~~~~~~~~
- (void)setTxt:(NSString *)txt {
    _txt = txt;
    _label.text = txt;
    
    if(txt.length <= 0) {
        return;
    }
    
    UILabel * Templabel = [[UILabel alloc] initWithFrame:_label.frame];
    Templabel.numberOfLines = 0;
    Templabel.font = _font ? _font : [UIFont systemFontOfSize:14];
    Templabel.text = txt;
    [Templabel sizeToFit];
    CGFloat tempHeight = Templabel.frame.size.height;
    if(tempHeight > _viewHighHeight) {
        _viewHighHeight = tempHeight;
    }
    
    if(_isTopStart) {
        [self labelIsTopStart];
    }
    
}

- (void)setColor:(UIColor *)color {
    _color = color;
    _label.backgroundColor = color;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    _label.font = font;
    if(self.txt.length > 0) {
        self.txt = _txt;
    }
}

- (void)setNumOfLine:(NSInteger)numOfLine {
    _numOfLine = numOfLine;
    _label.numberOfLines = numOfLine;
    if(self.txt.length > 0) {
        self.txt = _txt;
    }
}

- (void)setIsTopStart:(BOOL)isTopStart {
    _isTopStart = isTopStart;
    
    if(_isTopStart && _txt.length > 0) {
        self.txt = _txt;
    }
}

- (void)setColorSelected:(UIColor *)colorSelected {
    //修改
    [_backViewButton setBackgroundImage:[self createImageWithColor:[colorSelected colorWithAlphaComponent:0.5]] forState:UIControlStateHighlighted];
}

- (void)labelIsTopStart {
    UILabel * Templabel = [[UILabel alloc] initWithFrame:_label.frame];
    Templabel.numberOfLines = _numOfLine;
    Templabel.font = _font ? _font : [UIFont systemFontOfSize:14];
    Templabel.text = _txt;
    [Templabel sizeToFit];
    _labelHeight = Templabel.frame.size.height;
    _label.frame = CGRectMake(0, 0, _viewWidth, _labelHeight);
}


#pragma mark - ~~~~~~~~~~~ label点击处理 ~~~~~~~~~~~~~~~

- (void)labelUPButtoInOutsider {
    if([self.delegete respondsToSelector:@selector(RXLabelGetClick:)]) {
        [self.delegete RXLabelGetClick:self];
        
        _isHightHeight = !_isHightHeight;
        
        CGFloat height = _viewHeight;
        NSInteger numLines = _numOfLine;
        CGFloat tempLabelHeight = _labelHeight;
        if(_isHightHeight && _viewHighHeight > _viewHeight) {
            height = _viewHighHeight;
            tempLabelHeight = _viewHighHeight;
            numLines = 0;
        }
        _label.numberOfLines = numLines;
        self.frame = CGRectMake(_viewRect.origin.x, _viewRect.origin.y, _viewWidth, height);
        _label.frame = CGRectMake(0, 0, _viewWidth, tempLabelHeight);
        _backViewButton.frame = self.bounds;
    }
}

#pragma mark - ~~~~~~~~~~~ 把颜色 转换成 UIImage ~~~~~~~~~~~~~~~
///把颜色 转换成 UIImage
- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
