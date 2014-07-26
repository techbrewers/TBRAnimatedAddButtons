//
//  TBRAddAnimatedView.m
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 25/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRAddAnimatedView.h"

@interface TBRAddAnimatedView ()

@property (nonatomic, strong) CAShapeLayer *crossShapeLayer;

@end

@implementation TBRAddAnimatedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self.layer addSublayer:self.crossShapeLayer];

    }
    return self;
}

#pragma mark - Lazy initialization

- (CAShapeLayer *)crossShapeLayer
{
    if (_crossShapeLayer == nil) {
        _crossShapeLayer = [CAShapeLayer layer];
        _crossShapeLayer.bounds = self.bounds;
        _crossShapeLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
        _crossShapeLayer.path = [self crossPath].CGPath;
        _crossShapeLayer.strokeColor = [UIColor blackColor].CGColor;
        _crossShapeLayer.lineWidth = 2.0;
        _crossShapeLayer.lineCap = @"round";
        CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds),
                                          CGRectGetMidY(self.bounds));
        _crossShapeLayer.position = centerPoint;
    }
    
    return _crossShapeLayer;
}

- (UIBezierPath *)crossPath
{
    UIBezierPath *crossPath = [UIBezierPath bezierPath];
    CGRect bounds = self.bounds;
    
    CGPoint midLeftPoint = CGPointMake(CGRectGetMinX(bounds),
                                       CGRectGetMidY(bounds));
    
    CGPoint midRightPoint = CGPointMake(CGRectGetMaxX(bounds),
                                        CGRectGetMidY(bounds));
    
    [crossPath moveToPoint:midLeftPoint];
    [crossPath addLineToPoint:midRightPoint];
    
    
    CGPoint midTopPoint = CGPointMake(CGRectGetMidX(bounds),
                                      CGRectGetMaxY(bounds));
    
    CGPoint midBottomPoint = CGPointMake(CGRectGetMidX(bounds),
                                         CGRectGetMinY(bounds));
    
    [crossPath moveToPoint:midTopPoint];
    [crossPath addLineToPoint:midBottomPoint];
    
    return crossPath;
}

#pragma mark - Public methods

- (void)animateToAddState
{
    self.crossShapeLayer.affineTransform = CGAffineTransformMakeRotation(0);
    self.state = TBRAddAnimatedViewStateAdd;
}

- (void)animateToCancelState
{
    self.crossShapeLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
    self.state = TBRAddAnimatedViewStateCancel;
}

#pragma mark - Overridden setters

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    self.crossShapeLayer.strokeColor = tintColor.CGColor;
}


@end
