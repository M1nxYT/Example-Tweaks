#include <UIKit/UIKit.h>
#import <spawn.h>

@interface SBStatusBarManager : NSObject
@end

%hook SBStatusBarManager

-(void)handleStatusBarTapWithEvent:(id)arg1 {
    UIAlertView *optionsView = [[UIAlertView alloc] initWithTitle:@"Options" message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Settings", @"Respring", @"Enter SafeMode", @"UICache", nil];
    optionsView.tag = 1337;
    [optionsView show];
    %orig;
}

%new
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

	// Confirm View for each mf option
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


	// dealing with confirms
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
%end
