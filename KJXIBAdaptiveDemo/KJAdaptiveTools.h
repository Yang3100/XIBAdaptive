//
//  KJAdaptiveTools.h
//  Winpower
//
//  Created by 杨科军 on 2019/9/29.
//  Copyright © 2019 cq. All rights reserved.
//  适配Xib布局工具 - 在不同的手机上展示不同的尺寸
/* 用法说明:
 - (void)awakeFromNib{
 [super awakeFromNib];
 /// xib适配
 [KJAdaptiveTools viewLayoutWithXib:self];
 }
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KJAdaptiveTools : NSObject
#pragma mark - XIB适配
+ (void)kj_adaptiveViewLayoutWithViewXib:(UIView*)xibView;
@end

NS_ASSUME_NONNULL_END
