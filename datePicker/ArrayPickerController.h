//
//  ArrayDataSource.h
//  datePicker
//
//  Created by Rob Mayoff on 10/30/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

@import UIKit;

typedef void (^ArrayPickerControllerCallback)(id object, UIPickerView *pickerView);

@interface ArrayPickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;

@property (nonatomic, copy) NSArray *array;

// When the user selects a row in the picker view, I call `callback(object, pickerView)`. I hold `object` weakly, but retain it while calling `callback`.
- (void)setObject:(id)object callback:(ArrayPickerControllerCallback)callback;

@end

@interface NSObject (ArrayPickerControllerStringValue)

// Return the string that should represent me in the `UIPickerView` controlled by `controller`. The default implementation returns `[self description]`.
- (NSString *)stringValueForArrayPickerController:(ArrayPickerController *)controller;

@end
