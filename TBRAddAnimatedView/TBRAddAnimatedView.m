//
//  TBRAddAnimatedView.m
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 25/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRAddAnimatedView.h"

typedef NS_ENUM(NSInteger, ViewState) {
    ViewStateAdd = 0,
    ViewStateDelete
};

@interface TBRAddAnimatedView ()

@property (nonatomic, strong) CAShapeLayer *crossShapeLayer;
@property (nonatomic) ViewState viewState;
@property (nonatomic, strong) UIButton *button;

@end

@implementation TBRAddAnimatedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
        [self.layer addSublayer:_crossShapeLayer];
        
        self.viewState = ViewStateAdd;
        
        _button = [[UIButton alloc] initWithFrame:frame];
        [_button addTarget:self
                    action:@selector(buttonPressed)
          forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
    }
    return self;
}

- (void)buttonPressed
{
    switch (self.viewState) {
        case ViewStateAdd:
            [self animateToDelete];
            self.viewState = ViewStateDelete;
            break;
        case ViewStateDelete:
            [self animateToAdd];
            self.viewState = ViewStateAdd;
            break;
    }
}

- (UIBezierPath *)crossPath
{
    UIBezierPath *crossPath = [UIBezierPath bezierPath];
    CGRect bounds = self.crossShapeLayer.bounds;
    
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

- (void)animateToAdd
{
    self.crossShapeLayer.affineTransform = CGAffineTransformMakeRotation(0);
}

- (void)animateToDelete
{
    self.crossShapeLayer.affineTransform = CGAffineTransformMakeRotation(M_PI_4);
}


@end
