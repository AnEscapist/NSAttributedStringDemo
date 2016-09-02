//
//  MyTools.h
//  NSAttributedStringDemo
//
//  Created by Caixia Sun on 16/9/1.
//  Copyright © 2016年 CaixiaSun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyTools : NSObject

/**
 *  改变文字中某些字的颜色,将需要改变的词组用数组装起来
 */
+ (NSMutableAttributedString *)changeColorWithColor:(UIColor *)color OriginString:(NSString *)originString ChangeStringArray:(NSArray *)changeStringArray;

/**
 *  改变文字中某些字的字体和颜色
 */
+ (NSMutableAttributedString *)changeFontAndColorWithFont:(UIFont *)font Color:(UIColor *)color OriginString:(NSString *)originString ChangeStringArray:(NSArray *)changeStringArray;

/**
 *  改变文字的行间距
 */
+ (NSMutableAttributedString *)changeLineSpaceWithSpace:(CGFloat)space OriginString:(NSString *)originString;

/**
 *  改变文字的字间距
 */
+ (NSMutableAttributedString *)changeFontSpaceWithSpace:(CGFloat)space OriginString:(NSString *)originString;

/**
 *  自适应高度
 */
+ (CGFloat)calculateHeightWithContent:(NSString *)content;

@end
