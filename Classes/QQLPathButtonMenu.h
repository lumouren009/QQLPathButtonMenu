//
//  QQLPathButtonMenu.h
//  Pods
//
//  Created by alonsolu on 16/7/13.
//
//

#import <UIKit/UIKit.h>

@interface QQLPathButtonMenuConfig : NSObject
@property (nonatomic, assign) CGFloat endRadius; //直径
@property (nonatomic, strong) UIColor *backgroundViewColor; //背景色
@property (nonatomic, assign) NSTimeInterval duration; //动画时长
@end

typedef void (^MenuClickBlock)(NSInteger buttonIndex);
@interface QQLPathButtonMenu : UIView

@property (nonatomic, assign, getter=isExpanding) BOOL expanding;
@property (nonatomic, copy) MenuClickBlock menuClickBlock;

- (instancetype)initWithMainButton:(UIButton*)mainButton
                       closeButton:(UIButton*)closeButton
                        menuArrays:(NSArray*)menusArray
                            config:(QQLPathButtonMenuConfig*)config;
@end
