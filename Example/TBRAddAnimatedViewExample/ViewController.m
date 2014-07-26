//
//  ViewController.m
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 25/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "ViewController.h"

// Animate add buttons
#import "TBRAnimatedAddBarButtonItem.h"
#import "TBRAnimatedAddButton.h"



#pragma mark - Darker green
@implementation UIColor (DarkerColor)

+ (UIColor *)darkGreen
{
    return [UIColor colorWithRed:0.0 green:0.7 blue:0.0 alpha:1.0];
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TBRAnimatedAddBarButtonItem *rightButton = [[TBRAnimatedAddBarButtonItem alloc] initWithTarget:self
                                                                                            action:@selector(buttonPressed:)];
    [rightButton setTintColor:[UIColor darkGreen]];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    TBRAnimatedAddButton *addButton = [[TBRAnimatedAddButton alloc] initWithFrame:CGRectMake(135, 200, 30, 30)];
    [addButton setTintColor:[UIColor darkGreen]];
    
    [addButton addTarget:self
                  action:@selector(buttonPressed:)
        forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
}

- (void)buttonPressed:(id<TBRAnimatedAddViewProtocol>)button
{
    switch ([button state]) {
        case TBRAddAnimatedViewStateAdd: {
            [button setTintColor:[UIColor darkGreen]];
            break;
        }
        case TBRAddAnimatedViewStateCancel: {
            [button setTintColor:[UIColor redColor]];
            break;
        }
    }
}

@end




