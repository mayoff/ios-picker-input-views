//
//  DatePickerController.m
//  datePicker
//
//  Created by Rob Mayoff on 10/30/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

#import "DatePickerInputViewController.h"

@implementation DatePickerInputViewController {
    NSDateFormatter *_formatter;
}

- (void)configureDateFormatter:(void (^)(NSDateFormatter *formatter))block {
    block([self formatter]);
    [self updateTextField];
}

- (void)setDatePicker:(UIDatePicker *)datePicker {
    [_datePicker removeTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    _datePicker = datePicker;
    [_datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    [self updateTextField];
}

- (void)setTextField:(UITextField *)textField {
    _textField = textField;
    [self updateTextField];
}

- (NSDateFormatter *)formatter {
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
    }
    return _formatter;
}

- (void)datePickerValueChanged {
    [self updateTextField];
}

- (void)updateTextField {
    if (self.textField && self.datePicker) {
        self.textField.text = [self.formatter stringFromDate:self.datePicker.date];
    }
}

@end
