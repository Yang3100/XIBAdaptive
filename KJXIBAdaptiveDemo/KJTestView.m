//
//  KJTestView.m
//  KJXIBAdaptiveDemo
//
//  Created by 杨科军 on 2019/9/29.
//  Copyright © 2019 杨科军. All rights reserved.
//

#import "KJTestView.h"
#import "KJAdaptiveTools.h"

@implementation KJTestView

- (void)awakeFromNib{
    [super awakeFromNib];
    /// xib适配
    [KJAdaptiveTools kj_adaptiveViewLayoutWithViewXib:self];
    self.label.text = [NSString stringWithFormat:@"绿视图宽:%f  高:%f\n文字大小:%.2f\nBold字体大小:%f",self.view.frame.size.width,self.view.frame.size.height,self.label2.font.pointSize,self.label.font.pointSize];
}

@end
