//
//  QQLPathButtonItem.h
//  Pods
//
//  Created by alonsolu on 16/7/13.
//
//

#import <UIKit/UIKit.h>

@interface QQLPathButtonItemConfig : NSObject
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGFloat buttonLabelMargin;
@property (nonatomic, assign) CGSize buttonSize;
@property (nonatomic, assign) CGFloat fontSize;
@end

@interface QQLPathButtonItem : UIView
//展开时的角度
@property (nonatomic, assign) double expandAngle;

//paht展开动画时，按照开始点、远点、近点、终点的顺序进行
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint farPoint;
@property (nonatomic, assign) CGPoint nearPoint;
@property (nonatomic, assign) CGPoint endPoint;

@property (unsafe_unretained, nonatomic) IBOutlet UIButton *button;
+ (instancetype)buttonWithConfig:(QQLPathButtonItemConfig*)config
                          image:(UIImage*)image
                          title:(NSString*)title;
@end
