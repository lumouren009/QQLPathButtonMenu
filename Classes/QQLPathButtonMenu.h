//
//  QQLPathButtonMenu.h
//  Pods
//
//  Created by alonsolu on 16/7/13.
//
//

#import <UIKit/UIKit.h>

typedef void (^MenuClickBlock)(NSInteger buttonIndex);
@interface QQLPathButtonMenu : UIView

@property (nonatomic, assign, getter=isExpanding) BOOL expanding;
@property (nonatomic, copy) MenuClickBlock menuClickBlock;

- (instancetype)initWithMainButton:(UIButton*)mainButton
                       closeButton:(UIButton*)closeButton
                        menuArrays:(NSArray*)menusArray
                   backgroundColor:(UIColor*)backgroundColor;
@end
