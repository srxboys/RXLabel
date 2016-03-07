//
//  ViewController.m
//  RXLabel
//
//  Created by readtv_smx on 16/3/6.
//  Copyright © 2016年 GHS. All rights reserved.
//

#import "ViewController.h"

#import "RXLabel.h"

@interface ViewController ()<RXLabelDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    RXLabel * lable = [[RXLabel alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    lable.txt = @"srxboys\n大哉开元,元气旺盛,盛世华年,年年好运,运道齐天,天天 幸福 ,福海无边!";
    lable.numOfLine = 3;
    lable.tag = 1;
    lable.delegete = self;
    [self.view addSubview:lable];
    
    
    
    
    RXLabel * lable2 = [[RXLabel alloc] initWithFrame:CGRectMake(10, 230, 100, 100)];
    lable2.txt = @"  srxboys\n一元复始，万象更新。一抹朝阳代我为您沐面，一袭清风代我为您拂尘，飘香寒梅代我为您熏染，柳岸莺鸣代我为您祝福：祝您新春快乐! ";
    
    //行数
    lable2.numOfLine = 3;
    
    //是否 顶部对齐
    lable2.isTopStart = YES;
    
    //自定义 半透明的 选中颜色
    lable2.colorSelected = [UIColor redColor];
    
    lable2.delegete = self;
    lable2.tag = 2;
    [self.view addSubview:lable2];
    
    
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

}

- (void)RXLabelGetClick:(RXLabel *)RXLabel{
    NSLog(@"RXLabel GetClick-----tag=%ld-", RXLabel.tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
