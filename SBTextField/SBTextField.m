//
//  SBTextField.m
//  SBTextField
//
//  Created by Scott Berrevoets on 6/18/13.
//  Copyright (c) 2013 Scotty Doesn't Code. All rights reserved.
//

#import "SBTextField.h"

@interface SBTextField () <UITextFieldDelegate>
@property (nonatomic, weak) id <SBTextFieldDelegate> privateDelegate;
@end

@implementation SBTextField

@synthesize privateDelegate = _privateDelegate;

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	
	if (self)
		[super setDelegate:self];
    
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	
	self = [super initWithCoder:aDecoder];
	
	if (self)
		[super setDelegate:self];
	
	return self;
}

- (void)setDelegate:(id<SBTextFieldDelegate>)delegate {
	_privateDelegate = delegate;
}

- (id<SBTextFieldDelegate>)delegate {
	return _privateDelegate;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	if ([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)])
		return [self.delegate textFieldShouldBeginEditing:self];
	else
		return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	if ([self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:)])
		[self.delegate textFieldDidBeginEditing:self];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	if ([self.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
		return [self.delegate textFieldShouldEndEditing:self];
	else
		return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	if ([self.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)])
		[self.delegate textFieldShouldEndEditing:self];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	
	if (self.maxLength > 0) {
		NSUInteger oldLength = [textField.text length];
		NSUInteger replacementLength = [string length];
		NSUInteger rangeLength = range.length;
		
		NSUInteger newLength = oldLength - rangeLength + replacementLength;
		
		if (newLength > self.maxLength && [string rangeOfString: @"\n"].location == NSNotFound)
			return NO;
	}
	
	if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)])
		return [self.delegate textField:self shouldChangeCharactersInRange:range replacementString:string];
	else
		return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
	if ([self.delegate respondsToSelector:@selector(textFieldShouldClear:)])
		return [self.delegate textFieldShouldClear:self];
	else
		return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)])
		return [self.delegate textFieldShouldReturn:self];
	else
		return YES;
}


@end
