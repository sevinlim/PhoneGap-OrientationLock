/*
 * Copyright (C) 2015 Sevin Lim
 */

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <Cordova/CDVScreenOrientationDelegate.h>

#import "AppDelegate.h"

@interface OrientationLock : CDVPlugin <CDVScreenOrientationDelegate> {
	NSUInteger enabledOrientationMask;
}

-(void) unlock:(CDVInvokedUrlCommand*)command;
-(void) lock:(CDVInvokedUrlCommand*)command;
-(void) execute: (NSString*)action Arg:(NSArray*)argument Callback:(CDVPluginResult*)callback;

-(void) enable: (NSArray*)orientations;
-(int)getOrientationFromString:(NSString*)orientation;

@end
