//
//  UIView+OKBorder
//
//  Copyright © 2016年 OK Inc. All rights reserved.
//

#import "UIView+OKBorder.h"

@implementation UIView (OKBorder)

- (void)ok_clearBorderStyle {
    self.layer.borderWidth   = 0;
    self.layer.masksToBounds = YES;
}

- (void)ok_addBorderWithColor:(UIColor *)color borderSize:(CGFloat)borderSize borderType:(OKBorderType)type {
    [self ok_addBorderWithColor:color borderSize:borderSize opacity:1.0 margin:0.0 borderType:type];
}

- (void)ok_addBorderWithColor:(UIColor *)color borderSize:(CGFloat)borderSize margin:(CGFloat)margin borderType:(OKBorderType)type {
    
    [self ok_addBorderWithColor:color borderSize:borderSize opacity:1.0 margin:margin borderType:type];

}

- (void)ok_addBorderWithColor:(UIColor *)color borderSize:(CGFloat)borderSize opacity:(float)opacity borderType:(OKBorderType)type {
    
    [self ok_addBorderWithColor:color borderSize:borderSize opacity:opacity margin:0.0 borderType:type];
}

- (void)ok_addBorderWithColor:(UIColor *)color borderSize:(CGFloat)borderSize opacity:(float)opacity margin:(CGFloat)margin borderType:(OKBorderType)type {
    
    if (type & OKBorderTypeTop) {
        CALayer *border = [CALayer layer];
        border.opacity = opacity;
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(margin, 0, self.frame.size.width - margin, borderSize);
        [self.layer addSublayer:border];
    }
    
    if (type & OKBorderTypeLeft) {
        CALayer *border = [CALayer layer];
        border.opacity = opacity;
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(0, 0, borderSize, self.frame.size.height);
        [self.layer addSublayer:border];
    }
    
    if (type & OKBorderTypeBottom) {
        CALayer *border = [CALayer layer];
        border.opacity = opacity;
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(margin, self.frame.size.height - borderSize, self.frame.size.width - margin, borderSize);
        [self.layer addSublayer:border];
    }
    
    if (type & OKBorderTypeRight) {
        CALayer *border = [CALayer layer];
        border.opacity = opacity;
        border.backgroundColor = color.CGColor;
        border.frame = CGRectMake(self.frame.size.width - borderSize, 0, borderSize, self.frame.size.height);
        [self.layer addSublayer:border];
    }
}

@end
