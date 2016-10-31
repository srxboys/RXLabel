//
//  RXLabel.m
//  RXLabel
//
//  Created by srxboys on 16/3/6.
//  Copyright © 2016年 GHS. All rights reserved.
//
/// https://github.com/srxboys/RXLabel

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
    UIButton * _backViewButton;
    
}
@property (nonatomic, assign) CGFloat labelHeight;

@end

@implementation RXLabel
- (void)setLabelHeight:(CGFloat)height {
    _labelHeight = height;
    _pinchedHeight = height;
}

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
        self.labelHeight    = _viewHeight;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        _label.backgroundColor = [UIColor clearColor];
        _label.text = @"";
        _label.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_label];
        
        //         UIColor * colorAlpha = UIColorHexAlpha(@"#333333", 0.5);
        
        _backViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backViewButton.frame = CGRectMake(0, 0, _viewWidth, _viewHeight);
        [_backViewButton setBackgroundImage:[self createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        //        [_backViewButton setBackgroundImage:[self createImageWithColor:colorAlpha] forState:UIControlStateHighlighted];
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
    self.textColor     = [UIColor lightGrayColor];
    self.colorSelected = [UIColor grayColor];
    self.font          = [UIFont systemFontOfSize:14];
    self.numOfLine     = 1;
    self.lineSpacing   = 2;
    self.text          = @"";
}

#pragma mark - ~~~~~~~~~~~ 赋值 setter 重新 ~~~~~~~~~~~~~~~
- (void)setText:(NSString *)text {
    _text = text;
    
    if(text.length <= 0) {
        return;
    }
    
    
    UIFont * font = _font ? _font : [UIFont systemFontOfSize:14];
    NSTextAlignment align = _textAlignment ? _textAlignment : NSTextAlignmentLeft;
    NSMutableAttributedString *  tempAttri = [[NSMutableAttributedString alloc] initWithString:text];
    [tempAttri setAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: _textColor} range:NSMakeRange(0, tempAttri.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:_lineSpacing];
    [paragraphStyle setAlignment:align];
    [tempAttri addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, tempAttri.length)];
    
    
    UILabel * Templabel = [[UILabel alloc] initWithFrame:_label.frame];
    Templabel.numberOfLines = 0;
    Templabel.attributedText = tempAttri;
    [_label setAttributedText:tempAttri];
    [Templabel sizeToFit];
    CGFloat tempHeight = Templabel.frame.size.height;
    if(tempHeight > _viewHighHeight) {
        _viewHighHeight = tempHeight;
        _unfurlHeight = tempHeight;
    }
    
    if(_isTopStart) {
        [self labelIsTopStart];
    }
    
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    if(self.text.length > 0) {
        self.text = _text;
    }
}

- (void)setNumOfLine:(NSInteger)numOfLine {
    _numOfLine = numOfLine;
    _label.numberOfLines = numOfLine;
    if(self.text.length > 0) {
        self.text = _text;
    }
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
    if(self.text.length > 0) {
        self.text = _text;
    }
}


- (void)setLineSpacing:(NSInteger)lineSpacing {
    _lineSpacing = lineSpacing;
    if(self.text.length > 0) {
        self.text = _text;
    }
}


- (void)setIsTopStart:(BOOL)isTopStart {
    _isTopStart = isTopStart;
    
    if(_isTopStart && _text.length > 0) {
        self.text = _text;
    }
    
    
    
}

- (void)setColorSelected:(UIColor *)colorSelected {
    //修改
    [_backViewButton setBackgroundImage:[self createImageWithColor:[colorSelected colorWithAlphaComponent:0.5]] forState:UIControlStateHighlighted];
}



- (void)labelIsTopStart {
    UILabel * Templabel = [[UILabel alloc] initWithFrame:_label.frame];
    Templabel.numberOfLines = _numOfLine;
    UIFont * font = _font ? _font : [UIFont systemFontOfSize:14];
    NSTextAlignment align = _textAlignment ? _textAlignment : NSTextAlignmentLeft;
    NSMutableAttributedString *  tempAttri = [[NSMutableAttributedString alloc] initWithString:_text];
    [tempAttri setAttributes:@{NSFontAttributeName: font, NSForegroundColorAttributeName: _textColor} range:NSMakeRange(0, tempAttri.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:_lineSpacing];
    [paragraphStyle setAlignment:align];
    [tempAttri addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, tempAttri.length)];
    [Templabel setAttributedText:tempAttri];
    [Templabel sizeToFit];
    self.labelHeight = Templabel.frame.size.height;
    _label.frame = CGRectMake(0, 0, _viewWidth, self.labelHeight);
    if(_isAutoSize) {
        self.frame = CGRectMake(_viewRect.origin.x, _viewRect.origin.y, _viewWidth, self.labelHeight);
        _backViewButton.frame = self.bounds;
    }
}


#pragma mark - ~~~~~~~~~~~ label点击处理 ~~~~~~~~~~~~~~~

- (void)labelUPButtoInOutsider {
    if([self.delegete respondsToSelector:@selector(RXLabelGetClick:)]) {
        
        _isHightHeight = !_isHightHeight;
        
        CGFloat height = _viewHeight;
        NSInteger numLines = _numOfLine;
        CGFloat tempLabelHeight = self.labelHeight;
        if(_isHightHeight && _viewHighHeight > _viewHeight) {
            height = _viewHighHeight;
            tempLabelHeight = _viewHighHeight;
            numLines = 0;
        }
        _label.numberOfLines = numLines;
        if(_isAutoSize) {
            height = tempLabelHeight;
        }
        self.frame = CGRectMake(_viewRect.origin.x, _viewRect.origin.y, _viewWidth, height);
        _label.frame = CGRectMake(0, 0, _viewWidth, tempLabelHeight);
        _backViewButton.frame = self.bounds;
        
        [self.delegete RXLabelGetClick:self];
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
