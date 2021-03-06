#include "DISLRootListController.h"

@implementation DISLRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)Respring {
    [HBRespringController respring];
}

-(void)OpenGithub {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://github.com/p0358/DisintegrateLock"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Opened url");
		}
	}];
}

-(void)OpenPaypal {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://paypal.me/p0358donate"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Opened url");
		}
	}];
}

-(void)OpenReddit {
	UIApplication *application = [UIApplication sharedApplication];
	NSURL *URL = [NSURL URLWithString:@"https://reddit.com/u/p0358"];
	[application openURL:URL options:@{} completionHandler:^(BOOL success) {
		if (success) {
			NSLog(@"Opened url");
		}
	}];
}

-(void)Reset {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier: @"net.p0358.disintegratelock"];
	[prefs removeAllObjects];
	[prefs synchronize];

	//NSFileManager *fm = [NSFileManager defaultManager];
	//[fm removeItemAtPath: @"/var/mobile/Library/Preferences/net.p0358.disintegratelock.plist" error: nil];

	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("net.p0358.disintegratelock/ReloadPrefs"), NULL, NULL, TRUE);
	[self reloadSpecifiers];

	//[self Respring];
}

@end
