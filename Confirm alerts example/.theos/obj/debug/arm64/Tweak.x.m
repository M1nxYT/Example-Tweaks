#line 1 "Tweak.x"
#include <UIKit/UIKit.h>
#import <spawn.h>

@interface SBStatusBarManager : NSObject
@end


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBStatusBarManager; 
static void (*_logos_orig$_ungrouped$SBStatusBarManager$handleStatusBarTapWithEvent$)(_LOGOS_SELF_TYPE_NORMAL SBStatusBarManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBStatusBarManager$handleStatusBarTapWithEvent$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarManager* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SBStatusBarManager$alertView$clickedButtonAtIndex$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarManager* _LOGOS_SELF_CONST, SEL, UIAlertView *, NSInteger); 

#line 7 "Tweak.x"


static void _logos_method$_ungrouped$SBStatusBarManager$handleStatusBarTapWithEvent$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    UIAlertView *optionsView = [[UIAlertView alloc] initWithTitle:@"Options" message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Settings", @"Respring", @"Enter SafeMode", @"UICache", nil];
    optionsView.tag = 1337;
    [optionsView show];
    _logos_orig$_ungrouped$SBStatusBarManager$handleStatusBarTapWithEvent$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$SBStatusBarManager$alertView$clickedButtonAtIndex$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIAlertView * alertView, NSInteger buttonIndex) {

	
	if(alertView.tag == 1337 && buttonIndex == 1){
		UIAlertView *option2confirm = [[UIAlertView alloc] initWithTitle:@"Open Settings?" message:nil delegate:self cancelButtonTitle:@"Confirm" otherButtonTitles:@"Cancel", nil];
    	option2confirm.tag = 111;
    	[option2confirm show];
	}
	if(alertView.tag == 1337 && buttonIndex == 2){
		UIAlertView *option1confirm = [[UIAlertView alloc] initWithTitle:@"Respring?" message:nil delegate:self cancelButtonTitle:@"Confirm" otherButtonTitles:@"Cancel", nil];
    	option1confirm.tag = 222;
    	[option1confirm show];
	}
	if(alertView.tag == 1337 && buttonIndex == 3){
		UIAlertView *option2confirm = [[UIAlertView alloc] initWithTitle:@"Enter Safemode?" message:nil delegate:self cancelButtonTitle:@"Confirm" otherButtonTitles:@"Cancel", nil];
    	option2confirm.tag = 333;
    	[option2confirm show];
	}
	if(alertView.tag == 1337 && buttonIndex == 4){
		UIAlertView *option2confirm = [[UIAlertView alloc] initWithTitle:@"Refresh UICache?" message:nil delegate:self cancelButtonTitle:@"Confirm" otherButtonTitles:@"Cancel", nil];
    	option2confirm.tag = 444;
    	[option2confirm show];
	}


	
	if(alertView.tag == 111 && buttonIndex == 0){
		NSURL *url = [NSURL URLWithString:@"App-prefs:root"];

		if (![[UIApplication sharedApplication] canOpenURL:url]) {
			url = [NSURL URLWithString:@"App-prefs:root"];
		}
		[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
	}
	if(alertView.tag == 222 && buttonIndex == 0){
		pid_t pid;
		int status;
		const char* args[] = {"sbreload", NULL};
		posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
		waitpid(pid, &status, WEXITED);
	}
	if(alertView.tag == 333 && buttonIndex == 0){
		pid_t pid;
		int status;
		const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
		posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
		waitpid(pid, &status, WEXITED);
	}
	if(alertView.tag == 444 && buttonIndex == 0){
		pid_t pid;
		int status;
		const char* args[] = {"uicache", NULL};
		posix_spawn(&pid, "/usr/bin/uicache", NULL, NULL, (char* const*)args, NULL);
		waitpid(pid, &status, WEXITED);
	}
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBStatusBarManager = objc_getClass("SBStatusBarManager"); { MSHookMessageEx(_logos_class$_ungrouped$SBStatusBarManager, @selector(handleStatusBarTapWithEvent:), (IMP)&_logos_method$_ungrouped$SBStatusBarManager$handleStatusBarTapWithEvent$, (IMP*)&_logos_orig$_ungrouped$SBStatusBarManager$handleStatusBarTapWithEvent$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIAlertView *), strlen(@encode(UIAlertView *))); i += strlen(@encode(UIAlertView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBStatusBarManager, @selector(alertView:clickedButtonAtIndex:), (IMP)&_logos_method$_ungrouped$SBStatusBarManager$alertView$clickedButtonAtIndex$, _typeEncoding); }} }
#line 74 "Tweak.x"
