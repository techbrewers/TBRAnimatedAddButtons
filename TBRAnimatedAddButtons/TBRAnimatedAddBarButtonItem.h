//
//  TBRBarButtonItem.h
//  TBRAddAnimatedViewExample
//
//  Created by Luciano Marisi on 26/07/2014.
//  Copyright (c) 2014 TechBrewers LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TBRAddAnimatedView.h"

@interface TBRAnimatedAddBarButtonItem : UIBarButtonItem <TBRAnimatedAddViewProtocol>

/**
 *  Method for creating an instance of an animated add bar button
 *
 *  @param target The target object—that is, the object to which the action 
 *                message is sent.
 *  @param action A selector identifying an action message. It cannot be NULL.
 *
 *  @return An initialized view object or nil if the object couldn't be created.
 */
- (instancetype)initWithTarget:(id)target
                        action:(SEL)action;

@end
