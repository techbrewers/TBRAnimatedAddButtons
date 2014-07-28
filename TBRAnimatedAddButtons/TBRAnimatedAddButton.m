//
//  TBRAnimatedAddButton.m
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 26/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRAnimatedAddButton.h"

@interface TBRAnimatedAddButton ()

@property (nonatomic, strong) TBRAddAnimatedView *addAnimatedView;

@end

@implementation TBRAnimatedAddButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect viewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _addAnimatedView = [[TBRAddAnimatedView alloc] initWithFrame:viewFrame];
        _addAnimatedView.userInteractionEnabled = NO;
        [self addSubview:_addAnimatedView];
        
        //Action for animation
        [self addTarget:self
                 action:@selector(animateButtonPressed)
       forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)animateButtonPressed
{
    switch ([self viewState]) {
        case TBRAddAnimatedViewStateAdd: {
            [self.addAnimatedView animateToCancelState];
            break;
        }
        case TBRAddAnimatedViewStateCancel: {
            [self.addAnimatedView animateToAddState];
            break;
        }
    }
}

#pragma mark - TBRAnimatedAddViewProtocol

- (TBRAnimatedAddViewState)viewState
{
    return self.addAnimatedView.state;
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    self.addAnimatedView.tintColor = tintColor;
}

@end