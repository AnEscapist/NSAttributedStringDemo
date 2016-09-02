//
//  MyTools.m
//  NSAttributedStringDemo
//
//  Created by Caixia Sun on 16/9/1.
//  Copyright © 2016年 CaixiaSun. All rights reserved.
//

#import "MyTools.h"
#import <CoreText/CoreText.h>

@implementation MyTools

+ (NSMutableAttributedString *)changeColorWithColor:(UIColor *)color OriginString:(NSString *)originString ChangeStringArray:(NSArray *)changeStringArray
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originString];
    for (NSString *rangeStr in changeStringArray) {
        NSRange range = [originString rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    
    return attributedString;
}

+ (NSMutableAttributedString *)changeFontAndColorWithFont:(UIFont *)font Color:(UIColor *)color OriginString:(NSString *)originString  ChangeStringArray:(NSArray *)changeStringArray
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originString];
    for (NSString *rangeStr in changeStringArray) {
        NSRange range = [originString rangeOfString:rangeStr options:NSBackwardsSearch];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
        [attributedString addAttribute:NSFontAttributeName value:font range:range];
    }
    return attributedString;
}

+ (NSMutableAttributedString *)changeLineSpaceWithSpace:(CGFloat)space OriginString:(NSString *)originString
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originString];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = space;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [attributedString length])];
    return attributedString;
}

+ (NSMutableAttributedString *)changeFontSpaceWithSpace:(CGFloat)space OriginString:(NSString *)originString
{
    long number = space;
    CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:originString];
    [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(0, [attributedString length])];
    return attributedString;
}

+ (CGFloat)calculateHeightWithContent:(NSString *)content
{
    CGFloat height = [content boundingRectWithSize:CGSizeMake(kScreenWidth-24, kScreenHeight*1/5) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    
    return height+10;
}

@end
