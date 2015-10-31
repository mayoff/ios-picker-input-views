//
//  DatePickerController.h
//  datePicker
//
//  Created by Rob Mayoff on 10/30/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

@import UIKit;

@interface DatePickerInputViewController : NSObject

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) IBOutlet UITextField *textField;

- (void)configureDateFormatter:(void (^)(NSDateFormatter *formatter))block;

@end
