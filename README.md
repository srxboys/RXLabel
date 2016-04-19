# RXLabel
##可以点击显示更多的label / label Click to show more text
---
>没有底层的知识 一看就明白，由于需求不同 属性就多了些

---
###例子(如下): / Examples
```objc
    //默认样式
    RXLabel * lable = [[RXLabel alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    lable.text = @"srxboys\n大哉开元,元气旺盛,盛世华年,年年好运,运道齐天,天天 幸福 ,福海无边!";
    lable.numOfLine = 3;
    lable.tag = 1;
    lable.delegete = self;
    [self.view addSubview:lable];
    
    //--------------------------------------
    
    //修改全部属性
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


    ///Update
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
    **** 新增属性 / Add attribute
    * 1、txt 改为 text      /  txt --change name--> text
    * 2、新增 isAutoSize    /  new attribute -> isAutoSize
    * 3、新增 lineSpacing   /  new attribute -> lineSpacing
    * 4、新增 pinchedHeight /  new attribute -> pinchedHeight
    * 5、新增 unfurlHeight  /  new attribute -> unfurlHeight
    */
    //初始高度【isAutoSize == YES 会改变原始高度】
    CGFloat HighHeight = label3.pinchedHeight;

    //展开高度
    CGFloat height = label3.unfurlHeight;
```
###效果图(如下):
---
![srxboys](https://github.com/srxboys/RXLabel/blob/master/RXLabel.gif)  ![srxboys](https://github.com/srxboys/RXLabel/blob/master/RXLabel_2.gif)

