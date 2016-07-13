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
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (unsafe_unretained, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
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
  }
  return self;
}

- (void)setConfig:(QQLPathButtonItemConfig *)config {
  _config = config;
  if (config.buttonSize.height) {
    self.heightConstraint.constant = config.buttonSize.height;
  }
  if (config.buttonSize.width) {
    self.widthConstraint.constant = config.buttonSize.width;
  }
  if (config.fontSize) {
    self.label.font = [UIFont systemFontOfSize:config.fontSize];
  }
  if (config.buttonLabelMargin) {
    self.topConstraint.constant = config.buttonLabelMargin;
  }
}

@end


@implementation QQLPathButtonItemConfig

@end