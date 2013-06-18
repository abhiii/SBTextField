//
//  SBTextField.h
//  SBTextField
//
//  Created by Scott Berrevoets on 6/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SBTextField;

/*! This protocol is for the most part the same as the UITextFieldDelegate protocol. Any documentation provided in the UITextFieldDelegate protocol applies to this protocol as well. */
@protocol SBTextFieldDelegate <UITextFieldDelegate, NSObject>
@optional
- (BOOL)textFieldShouldBeginEditing:(SBTextField *)textField;
- (void)textFieldDidBeginEditing:(SBTextField *)textField;
- (BOOL)textFieldShouldEndEditing:(SBTextField *)textField;
- (void)textFieldDidEndEditing:(SBTextField *)textField;

// This method will not get called if the user tries to exceed the maximum number of characters allowed (as defined by maxLength)
- (BOOL)textField:(SBTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

- (BOOL)textFieldShouldClear:(SBTextField *)textField;
- (BOOL)textFieldShouldReturn:(SBTextField *)textField;
@end

/*! SBTextField is a drop-in replacement for UITextField that allows the user to limit the maximum number of characters that can be entered in the text field.
 */
@interface SBTextField : UITextField
@property (nonatomic, weak) id <SBTextFieldDelegate> delegate;

/*! Defines the maximum number of characters that can be entered in the text field. The default is 0, which translates to a virtually unlimited number of characters. */
@property (nonatomic) NSUInteger maxLength; // Default is 0, meaning unlimited
@end
