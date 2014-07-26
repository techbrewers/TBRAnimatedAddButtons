//
//  TBRBarButtonItem.m
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 26/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "TBRAnimatedAddBarButtonItem.h"
#import "TBRAnimatedAddButton.h"

static const CGRect kBarButtonFrame = {0, 0, 25, 25};

@interface TBRAnimatedAddBarButtonItem ()

@property (nonatomic, strong) TBRAnimatedAddButton *addButton;

@end

@implementation TBRAnimatedAddBarButtonItem

#pragma mark - Object lifecycle

- (instancetype)initWithTarget:(id)target
                        action:(SEL)action
{
    self.addButton = [[TBRAnimatedAddButton alloc] initWithFrame:kBarButtonFrame];
    
    [self.addButton addTarget:target
                       action:action
             forControlEvents:UIControlEventTouchUpInside];
    
    return [super initWithCustomView:self.addButton];
}

#pragma mark - TBRAnimatedAddViewProtocol

- (TBRAnimatedAddViewState)state
{
    return [self.addButton state];
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    self.addButton.tintColor = tintColor;
}

@end
