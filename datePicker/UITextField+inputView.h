//
//  UITextField+inputView.h
//  datePicker
//
//  Created by Rob Mayoff on 10/30/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (inputView)

@property (nullable, readwrite, strong) IBOutlet UIView *inputView;
@property (nullable, readwrite, strong) IBOutlet UIView *inputAccessoryView;

@end
