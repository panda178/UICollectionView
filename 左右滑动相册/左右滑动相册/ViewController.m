//
//  ViewController.m
//  左右滑动相册
//
//  Created by mac on 2021/3/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "FlowLayout.h"

#define CollectionCell @"COLLECTIONCELL"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
    [self setupCollectionView];
}

#pragma mark -初始化CollectionView
- (void) setupCollectionView {
    //初始化流水布局
    UICollectionViewFlowLayout *flowLayout = [self setupFlowLayout];
    CGRect rect = CGRectMake(0, self.view.center.y - 100, self.view.bounds.size.width, 250);
    //创建UICollectionView对象
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
    //设置背景颜色
    collectionView.backgroundColor = [UIColor brownColor];
    //设置数据源代理
    collectionView.dataSource = self;
    //注册一个PhotoCell xib类
    [PhotoCell registNib:collectionView flagName:CollectionCell];
    //添加到当前视图中
    [self.view addSubview:collectionView];
    
}

#pragma mark -初始化流布局对象
- (UICollectionViewFlowLayout *) setupFlowLayout {
    //创建流布局
    FlowLayout *flowLayout = [[FlowLayout alloc] init];
    //设置单元格大小
    flowLayout.itemSize = CGSizeMake(200, 200);
    //设置滚动方向(左右)
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置每个单元格的间距
    flowLayout.minimumLineSpacing = 50;
    //设置
    CGFloat leftAndRightInset = ScreenW * 0.5 - flowLayout.itemSize.width * 0.5;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, leftAndRightInset, 0, leftAndRightInset);
    return flowLayout;
}

#pragma mark -实现数据源协议

//返回单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

//返回每个单元格
/*
 UICollectionViewCell:类中只有一个UIView没有UIImage
 创建一个类继承自UICollectionViewCell重新实现我们的需求
 */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCell forIndexPath:indexPath];
    
    return cell;
}
@end
