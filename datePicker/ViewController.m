//
//  ViewController.m
//  datePicker
//
//  Created by Rob Mayoff on 10/22/15.
//  Copyright © 2015 Rob Mayoff. All rights reserved.
//

#import "ViewController.h"
#import "ArrayPickerController.h"
#import "DatePickerInputViewController.h"
#import "firstResponder.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *dateField;
@property (strong, nonatomic) IBOutlet UITextField *timeField;
@property (strong, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic) IBOutlet UITextField *countyField;

@property (strong, nonatomic) IBOutlet DatePickerInputViewController *datePickerController;
@property (strong, nonatomic) IBOutlet DatePickerInputViewController *timePickerController;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (strong, nonatomic) IBOutlet ArrayPickerController *countryPickerController;
@property (strong, nonatomic) IBOutlet ArrayPickerController *countyPickerController;
@property (strong, nonatomic) IBOutlet UIPickerView *countryPicker;
@property (strong, nonatomic) IBOutlet UIPickerView *countyPicker;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFields;

@end

@implementation ViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.alwaysBounceVertical = NO;

    self.textFields = [self.textFields sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return ((UIView *)obj1).tag - ((UIView *)obj2).tag;
    }];

    [self.datePickerController configureDateFormatter:^(NSDateFormatter *formatter) {
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterNoStyle;
    }];

    [self.timePickerController configureDateFormatter:^(NSDateFormatter *formatter) {
        formatter.dateStyle = NSDateFormatterNoStyle;
        formatter.timeStyle = NSDateFormatterShortStyle;
    }];

    self.countryPickerController.array = [@[ @"USA", @"England", @"Scotland", @"France", @"Ireland", @"Germany", @"China", @"Laos", @"Chad" ] sortedArrayUsingSelector:@selector(compare:)];
    [self.countryPickerController setObject:self callback:^(id object, UIPickerView *pickerView) {
        [object countryWasPicked];
    }];

    self.countyPickerController.array = [@[ @"York", @"Kent", @"Travis", @"Williamsburg", @"Dallas", @"Orange", @"Hayes" ] sortedArrayUsingSelector:@selector(compare:)];
    [self.countyPickerController setObject:self callback:^(id object, UIPickerView *pickerView) {
        [object countyWasPicked];
    }];
}

- (void)countryWasPicked {
    self.countryField.text = self.countryPickerController.array[[self.countryPicker selectedRowInComponent:0]];
}

- (void)countyWasPicked {
    self.countyField.text = self.countyPickerController.array[[self.countyPicker selectedRowInComponent:0]];
}

- (IBAction)sendCatFacts {
    [self.view.window endEditing:YES];
}

- (IBAction)priorWasClicked:(id)sender {
    NSInteger index = [self indexOfFirstResponderInTextFields];
    if (index == NSNotFound) {
        return;
    }
    index--;
    if (index < 0) {
        index = self.textFields.count - 1;
    }
    [self.textFields[index] becomeFirstResponder];
}

- (IBAction)nextWasClicked:(id)sender {
    NSInteger index = [self indexOfFirstResponderInTextFields];
    if (index == NSNotFound) {
        return;
    }
    index++;
    if (index >= self.textFields.count) {
        index = 0;
    }
    [self.textFields[index] becomeFirstResponder];
}

- (NSInteger)indexOfFirstResponderInTextFields {
    UITextField *textField = (UITextField *)firstResponder();
    if (![textField isKindOfClass:[UITextField class]]) {
        return NSNotFound;
    }
    return [self.textFields indexOfObject:textField];
}

- (IBAction)doneWasClicked:(id)sender {
    [self.view.window endEditing:YES];
}

@end
