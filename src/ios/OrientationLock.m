/*
 * Copyright (C) 2015 Sevin Lim
 */

#import "OrientationLock.h"

@implementation OrientationLock

- (CDVPlugin*)initWithWebView:(UIWebView*)theWebView {
	self = [super initWithWebView:theWebView];
	if (self) {
		enabledOrientationMask = UIInterfaceOrientationMaskPortrait;
	}
	return self;
}

-(void) unlock:(CDVInvokedUrlCommand*)command {
	NSArray* orientations = [NSArray arrayWithObjects:@"landscapeLeft", @"landscapeRight", @"portrait", nil];
	[self enable:orientations];
}

-(void) lock:(CDVInvokedUrlCommand*)command {
	NSNumber *value = [NSNumber numberWithInt:[self getOrientationFromString:[command argumentAtIndex:0]]];
	[[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}

-(void) execute:(NSString*)action Arg:(NSArray*)argument Callback:(CDVPluginResult*)callback {

}

-(int)getOrientationFromString:(NSString*)orientation {
	if ([orientation isEqualToString:@"landscapeLeft"]) {
		return UIInterfaceOrientationLandscapeLeft;
	}
	else if ([orientation isEqualToString:@"landscapeRight"]) {
		return UIInterfaceOrientationLandscapeRight;
	}
	else if ([orientation isEqualToString:@"portraitDown"]) {
		return UIInterfaceOrientationPortraitUpsideDown;
	}
	return UIInterfaceOrientationPortrait;
}

-(int)getOrientationMaskFromString:(NSString*)orientation {
	if ([orientation isEqualToString:@"landscapeLeft"]) {
		return UIInterfaceOrientationMaskLandscapeLeft;
	}
	else if ([orientation isEqualToString:@"landscapeRight"]) {
		return UIInterfaceOrientationMaskLandscapeRight;
	}
	else if ([orientation isEqualToString:@"portraitDown"]) {
		return UIInterfaceOrientationMaskPortraitUpsideDown ;
	}
	return UIInterfaceOrientationMaskPortrait ;
}

-(void) enable: (NSArray*)orientations {
	enabledOrientationMask = 0;
	for (NSString* orientation in orientations) {
        enabledOrientationMask |= [self getOrientationMaskFromString:orientation];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return enabledOrientationMask & (1 << interfaceOrientation) ;
}

- (BOOL)shouldAutorotate {
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
	return enabledOrientationMask;
}

@end
