//
//  TBRAddAnimatedView.h
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 25/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TBRAnimatedAddViewState)
{
    TBRAddAnimatedViewStateAdd,     // -> + shape shown
    TBRAddAnimatedViewStateCancel   // -> x shape shown
};

@protocol TBRAnimatedAddViewProtocol <NSObject>

- (TBRAnimatedAddViewState)viewState;
- (void)setTintColor:(UIColor *)tintColor;

@end

@interface TBRAddAnimatedView : UIView

@property (nonatomic) TBRAnimatedAddViewState state;


- (void)animateToAddState;

- (void)animateToCancelState;

@end
