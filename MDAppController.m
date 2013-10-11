//
//  Mouse_Moved_vs_Tracking_AreasAppDelegate.m
//  Mouse Moved vs Tracking Areas
//
//  Created by Mark Douma on 10/31/2010.
//  Copyright 2010 Mark Douma LLC. All rights reserved.
//

#import "MDAppController.h"
#import "MDTrackingView.h"
#import "MDMouseMovedView.h"


@implementation MDAppController

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

- (IBAction)reset:(id)sender {
	[trackingView reset];
	[mouseMovedView reset];
}

@end
