//
//  ViewController.m
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 25/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import "ViewController.h"
#import "TBRAddAnimatedView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = CGRectMake(0, 0, 25, 25);
	TBRAddAnimatedView *addAnimatedView = [[TBRAddAnimatedView alloc] initWithFrame:frame];
    addAnimatedView.userInteractionEnabled = YES;
    [self.view addSubview:addAnimatedView];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:addAnimatedView];
    self.navigationItem.rightBarButtonItem = rightButton;
}

@end
