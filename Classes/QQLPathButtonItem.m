//
//  QQLPathButtonItem.m
//  Pods
//
//  Created by alonsolu on 16/7/13.
//
//

#import "QQLPathButtonItem.h"

@interface QQLPathButtonItem ()


@property (unsafe_unretained, nonatomic) IBOutlet UILabel *label;
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (nonatomic, strong) QQLPathButtonItemConfig *config;

@end
@implementation QQLPathButtonItem 
+ (instancetype)buttonWithConfig:(QQLPathButtonItemConfig *)config
                           image:(UIImage *)image
                           title:(NSString *)title {
  QQLPathButtonItem *item = [[QQLPathButtonItem alloc]initWithFrame:config.frame];
  item.config = config;
  [item.button setImage:image forState:UIControlStateNormal];
  [item.label setText:title];
  return item;
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil][0];
    self.backgroundColor = [UIColor clearColor];
    self.topConstraint.constant = self.config.buttonLabelMargin;
  }
  return self;
}

@end


@implementation QQLPathButtonItemConfig

@end