//
//  KJAdaptiveTools.m
//  Winpower
//
//  Created by 杨科军 on 2019/9/29.
//  Copyright © 2019 cq. All rights reserved.
//

#import "KJAdaptiveTools.h"

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
