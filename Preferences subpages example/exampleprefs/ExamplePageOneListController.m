#include "ExamplePageOneListController.h"

@implementation ExamplePageOneListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"PageOne" target:self];
	}

	return _specifiers;
}

@end
