# KJAdaptiveTools
一款XIB适配的工具
<p align="left">
  <img width="200" src="Res/IMG_0013.png" hspace="30px" />
  <img width="200" src="Res/IMG_7170.png" hspace="30px" />
</p>
> 第一张是在6s上面显示  
> 第二张是在8p上面显示

----------------------------------------
### 框架整体介绍
* [作者信息](#作者信息)
* [作者其他库](#作者其他库)
* [方法介绍](#方法介绍)
* [使用方法](#使用方法)

#### <a id="作者信息"></a>作者信息
> Github地址：https://github.com/yangKJ  
> 简书地址：https://www.jianshu.com/u/c84c00476ab6  
> 博客地址：https://blog.csdn.net/qq_34534179  

#### <a id="作者其他库"></a>作者其他Pod库
```
播放器 - KJPlayer是一款视频播放器，AVPlayer的封装，继承UIView
pod 'KJPlayer'  # 播放器功能区
pod 'KJPlayer/KJPlayerView'  # 自带展示界面

实用又方便的Category和一些自定义控件
pod 'KJEmitterView'
pod 'KJEmitterView/Function'#
pod 'KJEmitterView/Control' # 自定义控件

轮播图 - 支持缩放 多种pagecontrol 支持继承自定义样式 自带网络加载和缓存
pod 'KJBannerView'  # 轮播图，网络图片加载

菜单控件 - 下拉控件 选择控件
pod 'KJMenuView' # 菜单控件

加载Loading - 多种样式供选择
pod 'KJLoadingAnimation' # 加载控件

```

##### Issue
如果您在使用中有好的需求及建议，或者遇到什么bug，欢迎随时issue，我会及时的回复，有空也会不断优化更新这些库

#### <a id="方法介绍"></a>方法介绍
```
#pragma mark - XIB适配
+ (void)kj_adaptiveViewLayoutWithViewXib:(UIView*)xibView;
```
m文件实现方法

```
#define UI_WIDTH  (375.0)
#define UI_HEIGHT (667.0)
#define ADAPTIVE_WIDTH(Width)   [UIScreen mainScreen].bounds.size.width * (Width) / UI_WIDTH
#define ADAPTIVE_HEIGHT(Height) [UIScreen mainScreen].bounds.size.height* (Height)/ UI_HEIGHT

@implementation KJAdaptiveTools
#pragma mark - XIB适配
+ (void)kj_adaptiveViewLayoutWithViewXib:(UIView *)xibView{
    //视图自适应布局
    for (UIView *view in xibView.subviews) {
        CGRect kj_rect = {ADAPTIVE_WIDTH(view.frame.origin.x),
                          ADAPTIVE_HEIGHT(view.frame.origin.y),
                          ADAPTIVE_WIDTH(view.frame.size.width),
                          ADAPTIVE_HEIGHT(view.frame.size.height)
        };
        if (view.frame.size.width == view.frame.size.height) {
            kj_rect.size.width  = ADAPTIVE_HEIGHT(view.frame.size.width);
            kj_rect.size.height = ADAPTIVE_HEIGHT(view.frame.size.width);
        }
        if ([view isKindOfClass:[UIImageView class]] && view.frame.size.width == view.frame.size.height) {
            kj_rect.origin.y = ADAPTIVE_HEIGHT(view.frame.origin.y) + (ADAPTIVE_HEIGHT(view.frame.size.height) - ADAPTIVE_WIDTH(view.frame.size.height))*.5;
            kj_rect.size.width = ADAPTIVE_WIDTH(view.frame.size.width);
            kj_rect.size.height = ADAPTIVE_WIDTH(view.frame.size.width);
        }
        view.frame = kj_rect;

        /// 字体适配
        [self kj_fontLayoutWithView:view];
    }
}

// 字体适配
+ (void)kj_fontLayoutWithView:(UIView*)view{
    if ([view isKindOfClass:[UITextField class]]) {
        UITextField *textField = (UITextField *)view;
        CGFloat fontSize = textField.font.pointSize;
        NSString *fontName = textField.font.fontName;
        textField.font = [UIFont fontWithName:fontName size:(ADAPTIVE_WIDTH(fontSize))];
    }else if ([view isKindOfClass:[UILabel class]]){
        UILabel *label = (UILabel *)view;
        CGFloat fontSize = label.font.pointSize;
        NSString *fontName = label.font.fontName;
        label.font = [UIFont fontWithName:fontName size:(ADAPTIVE_WIDTH(fontSize))];
    }else if ([view isKindOfClass:[UIButton class]]){
        UIButton *button = (UIButton *)view;
        CGFloat fontSize = button.titleLabel.font.pointSize;
        NSString *fontName = button.titleLabel.font.fontName;
        button.titleLabel.font = [UIFont fontWithName:fontName size:(ADAPTIVE_WIDTH(fontSize))];
    }
}

@end

```

#### <a id="使用方法"></a>使用方法
```
- (void)awakeFromNib{
    [super awakeFromNib];
    /// xib适配
    [KJAdaptiveTools kj_adaptiveViewLayoutWithViewXib:self];
    self.label.text = [NSString stringWithFormat:@"绿视图宽:%f  高:%f\n文字大小:%.2f",self.view.frame.size.width,self.view.frame.size.height,self.label2.font.pointSize];
}

```