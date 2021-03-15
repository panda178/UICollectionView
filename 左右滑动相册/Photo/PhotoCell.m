//
//  PhotoCell.m
//  左右滑动相册
//
//  Created by mac on 2021/3/14.
//  Copyright © 2021 mac. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (void) registNib:(UICollectionView *) collectionView flagName:(NSString *) flageName {
    
    NSString *clsName = NSStringFromClass([self class]);
    UINib *nib = [UINib nibWithNibName:clsName bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:flageName];
}

@end
