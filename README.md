TBRAnimatedAddButtons
=====================

[![Build Status](https://travis-ci.org/techbrewers/TBRAddAnimatedView.svg)](https://travis-ci.org/techbrewers/TBRAddAnimatedView)

Add button that animates to a cross (X) when pressed

Screenshot
--------------------

TO DO

Installation
-------------

* Add the classes inside TBRAnimatedAddButtons folder to your project
	*	TBRAddAnimatedView
	*	TBRAnimatedAddBarButtonItem
	*	TBRAnimatedAddButton


Example
-----------------------
```objc
// UIBarButtonItem sample
TBRAnimatedAddBarButtonItem *rightButton = [[TBRAnimatedAddBarButtonItem alloc] initWithTarget:self
                                                                                        action:@selector(buttonPressed:)];
[rightButton setTintColor:[UIColor greenColor]];
self.navigationItem.rightBarButtonItem = rightButton;

// UIButton sample
TBRAnimatedAddButton *addButton = [[TBRAnimatedAddButton alloc] initWithFrame:CGRectMake(145, 200, 30, 30)];
[addButton setTintColor:[UIColor greenColor]];

[addButton addTarget:self
              action:@selector(buttonPressed:)
    forControlEvents:UIControlEventTouchUpInside];
[self.view addSubview:addButton];


// Example of buttons action with color changes
- (void)buttonPressed:(id<TBRAnimatedAddViewProtocol>)button
{
    switch ([button viewState]) {
        case TBRAddAnimatedViewStateAdd: {
            [button setTintColor:[UIColor greenColor]];
            break;
        }
        case TBRAddAnimatedViewStateCancel: {
            [button setTintColor:[UIColor redColor]];
            break;
        }
    }
}
```

License
==================

The MIT License (MIT)

Copyright (c) 2014 TechBrewers LTD.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.