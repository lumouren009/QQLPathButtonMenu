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

@end
@implementation QQLPathButtonItem 
+ (instancetype)buttonWithFrame:(CGRect)frame
                          image:(UIImage *)image
                          title:(NSString *)title {
  QQLPathButtonItem *item = [[QQLPathButtonItem alloc]initWithFrame:frame];
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

@end
