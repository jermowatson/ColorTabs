//
//  CRNavigationBar.m
//  TabBarColor
//
//  Created by Jeremy on 24/09/13.
//  Copyright (c) 2013 Elder Brother Bear. All rights reserved.
//

#import "CRNavigationBar.h"

////////////////////////////
// CRNavigationBar.m
////////////////////////////


@interface CRNavigationBar ()
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation CRNavigationBar

static CGFloat const kDefaultColorLayerOpacity = 0.8f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;

//- (void)setBarTintColor:(UIColor *)barTintColor {
//    [super setBarTintColor:barTintColor];
//    if (self.colorLayer == nil) {
//        self.colorLayer = [CALayer layer];
//        self.colorLayer.opacity = kDefaultColorLayerOpacity;
//        [self.layer addSublayer:self.colorLayer];
//    }
//    self.colorLayer.backgroundColor = barTintColor.CGColor;
//}
//
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    if (self.colorLayer != nil) {
//        self.colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + kSpaceToCoverStatusBars);
//        
//        [self.layer insertSublayer:self.colorLayer atIndex:1];
//    }
//}





- (void)setBarTintColor:(UIColor *)barTintColor
{
    [super setBarTintColor:barTintColor];
    if (self.colorLayer == nil)
    {
        self.colorLayer = [CALayer layer];
        self.colorLayer.opacity = kDefaultColorLayerOpacity;
        [self.layer insertSublayer:self.colorLayer atIndex:1]; // This way the text comes out clear
    }
    self.colorLayer.backgroundColor = barTintColor.CGColor;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.colorLayer != nil)
    {
        self.colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + kSpaceToCoverStatusBars);
    }
}

- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview
{
    [super insertSubview:view aboveSubview:siblingSubview];
    [self.colorLayer removeFromSuperlayer];
    [self.layer insertSublayer:self.colorLayer atIndex:1]; // This way the text comes out clear
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
    [self.colorLayer removeFromSuperlayer];
    [self.layer insertSublayer:self.colorLayer atIndex:1]; // This way the text comes out clear
}

- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview
{
    [super insertSubview:view belowSubview:siblingSubview];
    [self.colorLayer removeFromSuperlayer];
    [self.layer insertSublayer:self.colorLayer atIndex:1]; // This way the text comes out clear
}

@end