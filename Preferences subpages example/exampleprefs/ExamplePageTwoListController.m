#include "ExamplePageTwoListController.h"

@implementation ExamplePageTwoListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"PageTwo" target:self];
	}

	return _specifiers;
}

@end
