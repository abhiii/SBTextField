//
//  ViewController.m
//  SBTextField
//
//  Created by Scott Berrevoets on 6/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import "ViewController.h"
#import "SBTextField.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet SBTextField *textField;
@end

@implementation ViewController

- (void)setTextField:(SBTextField *)textField {
	_textField = textField;
	_textField.maxLength = 10;
}

@end
