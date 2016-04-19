//
//  ViewController.m
//  RXLabel
//
//  Created by readtv_smx on 16/3/6.
//  Copyright © 2016年 GHS. All rights reserved.
//


#import "ViewController.h"

#import "RXLabel.h"

#import "UIAlertTool.h"

@interface ViewController ()<RXLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    RXLabel * lable = [[RXLabel alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    lable.text = @"srxboys\n大哉开元,元气旺盛,盛世华年,年年好运,运道齐天,天天 幸福 ,福海无边!";
    lable.numOfLine = 3;
    lable.tag = 1;
    lable.delegete = self;
    [self.view addSubview:lable];
    
    
    
    
    RXLabel * lable2 = [[RXLabel alloc] initWithFrame:CGRectMake(10, 230, 100, 100)];
    lable2.text = @"  srxboys\n一元复始，万象更新。一抹朝阳代我为您沐面，一袭清风代我为您拂尘，飘香寒梅代我为您熏染，柳岸莺鸣代我为您祝福：祝您新春快乐! ";
    
    //行数
    lable2.numOfLine = 3;
    
    //是否 顶部对齐
    lable2.isTopStart = YES;
    
    //自定义 半透明的 选中颜色
    lable2.colorSelected = [UIColor redColor];
    
    lable2.delegete = self;
    lable2.tag = 2;
    [self.view addSubview:lable2];
    
    
    RXLabel * label3 = [[RXLabel alloc] initWithFrame:CGRectMake(10, 230 + 10 + lable2.unfurlHeight, 100, 100)];
    label3.text = @"  srxboys\n一元复始，万象更新。一抹朝阳代我为您沐面，一袭清风代我为您拂尘，飘香寒梅代我为您熏染，柳岸莺鸣代我为您祝福：祝您新春快乐! ";
    
    //行数
    label3.numOfLine = 3;
    
    //是否 顶部对齐
    label3.isTopStart = YES;
    
    //是否 按文字大小收缩 【new】
    label3.isAutoSize = YES;
    
    //自定义 半透明的 选中颜色
    label3.colorSelected = [UIColor yellowColor];
    
    //行间距 【new】
    label3.lineSpacing = 5;
    
    label3.delegete = self;
    label3.tag = 3;
    [self.view addSubview:label3];
    
    /**
     * 当RXLabel的text 赋值后
     */
    //初始高度【isAutoSize == YES 会改变原始高度】
    CGFloat HighHeight = label3.pinchedHeight;
    
    //展开高度
    CGFloat height = label3.unfurlHeight;
    
    ///========================================================================
    /*
     下面是说明的
     */
    
    UILabel * LabelTxt1 = [[UILabel alloc] initWithFrame:CGRectMake(140, 100, 100, 100)];
    LabelTxt1.text = @"----------------\n默认字体、默认不是顶部对齐、默认选中颜色\n----------------";
    LabelTxt1.numberOfLines = 0;
    LabelTxt1.textColor = [UIColor colorWithRed:0.2888 green:0.5344 blue:1.0 alpha:1.0];
    LabelTxt1.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:LabelTxt1];
    
    UILabel * LabelTxt2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 230, 100, 100)];
    LabelTxt2.text = @"----------------\n自定义 字体、顶部对齐、选中颜色\n----------------";
    LabelTxt2.textColor = [UIColor colorWithRed:0.2888 green:0.5344 blue:1.0 alpha:1.0];
    LabelTxt2.font = [UIFont systemFontOfSize:13];
    LabelTxt2.numberOfLines = 0;
    [self.view addSubview:LabelTxt2];
    
    
    
    UILabel * LabelTxt3 = [[UILabel alloc] initWithFrame:CGRectMake(140, 230 + 10 + lable2.unfurlHeight, 100, 150)];
    LabelTxt3.text = @"----------------\n自定义:\n 字体、顶部对齐、按文字缩放控件、选中颜色、获取展开 缩放的高度 、行间距5\n----------------";
    LabelTxt3.textColor = [UIColor colorWithRed:0.5888 green:0.3344 blue:1.0 alpha:1.0];
    LabelTxt3.font = [UIFont systemFontOfSize:13];
    LabelTxt3.numberOfLines = 0;
    [self.view addSubview:LabelTxt3];
    
}


- (void)RXLabelGetClick:(RXLabel *)RXLabel{
//    NSLog(@"RXLabel GetClick-----tag=%ld-", RXLabel.tag);

    NSString * message = [NSString stringWithFormat:@"RXLabel.tag=%ld==RXLabel展开高%f==RXLabel收缩的高度=%f", (long)RXLabel.tag, RXLabel.unfurlHeight, RXLabel.pinchedHeight];
    
    UIAlertTool * alert = [[UIAlertTool alloc] init];
    
   [alert showAlertView:self title:@"您点击了" message:message cancelButtonTitle:@"取消" otherButtonTitle:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
