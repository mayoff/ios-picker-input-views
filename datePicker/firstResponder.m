//
//  firstResponder.m
//  datePicker
//
//  Created by Rob Mayoff on 10/31/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

#import "firstResponder.h"

static UIResponder *theFirstResponder;

@interface UIResponder (FirstResponderFinder)
@end

@implementation UIResponder (FirstResponderFinder)

- (void)FirstResponderFinder_reportFirstResponder {
    theFirstResponder = self;
}

@end

UIResponder *firstResponder(void) {
    [[UIApplication sharedApplication] sendAction:@selector(FirstResponderFinder_reportFirstResponder) to:nil from:nil forEvent:nil];
    UIResponder *it = theFirstResponder;
    theFirstResponder = nil;
    return it;
}
