//
//  FlowLayout.m
//  左右滑动相册
//
//  Created by mac on 2021/3/15.
//  Copyright © 2021 mac. All rights reserved.
//
//  继承自流水布局类，重写里面的一些函数实现自定义功能

#import "FlowLayout.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@implementation FlowLayout

#pragma mark -返回可视返回内的单元格
/**
 函数功能：返回矩形范围内的单元格
 */
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        //把每个单元格中心位置-内容视图移除屏幕的那部分=单元格在屏幕上的X坐标
        CGFloat visibleX = attr.center.x - self.collectionView.contentOffset.x;
        //单元格在屏幕上的X坐标-屏幕中心位置坐标=单元格距离屏幕中心的值
        CGFloat centerDiff = visibleX - ScreenW * 0.5;
        //把距离转换成缩放的值
        CGFloat zoomValue = 1.0 - fabs(centerDiff) / ScreenW * 0.5;
        attr.transform = CGAffineTransformMakeScale(zoomValue, zoomValue);
    }
    return attributes;
}

#pragma mark -是否重新刷新布局
/**
 函数功能：是否允许单元格重新布局
 描述：当单元格大小发送改变后是否刷新进行重新布局
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

#pragma mark -返回滚动停止的位置
/**
 函数功能：返回滚动停止的位置
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGRect rect = CGRectMake(proposedContentOffset.x, 0, ScreenW, 200);
    //返回一个矩形范围内的单元格
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attr in attributes) {
        //把每个单元格中心位置-内容视图移除屏幕的那部分=单元格在屏幕上的X坐标
        CGFloat visibleX = attr.center.x - proposedContentOffset.x;
        //单元格在屏幕上的X坐标-屏幕中心位置坐标=单元格距离屏幕中心的值
        CGFloat centerDiff = visibleX - ScreenW * 0.5;
        //判断哪个单元距离屏幕中心最近
        minDelta = fabs(centerDiff) < fabs(minDelta) ? centerDiff : minDelta;
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}
@end
