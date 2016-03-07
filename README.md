# RXLabel
##可以点击显示更多的label / label Click to show more text
---

###例子(如下):
```objc
    //默认样式
    RXLabel * lable = [[RXLabel alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    lable.txt = @"srxboys\n大哉开元,元气旺盛,盛世华年,年年好运,运道齐天,天天 幸福 ,福海无边!";
    lable.numOfLine = 3;
    lable.tag = 1;
    lable.delegete = self;
    [self.view addSubview:lable];
    
    //--------------------------------------
    
    //修改全部属性
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
```
###效果图(如下):
---
![](https://github.com/srxboys/RXLabel/blob/master/iOS_label.gif)
