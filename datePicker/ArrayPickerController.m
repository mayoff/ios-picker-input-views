//
//  ArrayDataSource.m
//  datePicker
//
//  Created by Rob Mayoff on 10/30/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

#import "ArrayPickerController.h"

@implementation ArrayPickerController {
    __weak id _object;
    ArrayPickerControllerCallback _callback;
}

- (void)setObject:(id)object callback:(ArrayPickerControllerCallback)callback {
    _object = object;
    _callback = callback;
}

- (void)setPickerView:(UIPickerView *)pickerView {
    _pickerView = pickerView;
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [_pickerView reloadAllComponents];
}

- (void)setArray:(NSArray *)array {
    _array = [array copy];
    [_pickerView reloadAllComponents];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.array.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.array[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (_callback) {
        __strong id strongObject = _object;
        _callback(strongObject, pickerView);
    }
}

@end

@implementation NSObject (ArrayPickerControllerStringValue)

- (NSString *)stringValueForArrayPickerController:(ArrayPickerController *)controller {
    return [self description];
}

@end
