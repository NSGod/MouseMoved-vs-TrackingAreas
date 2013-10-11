//
//  Mouse_Moved_vs_Tracking_AreasAppDelegate.h
//  Mouse Moved vs Tracking Areas
//
//  Created by Mark Douma on 10/31/2010.
//  Copyright 2010 Mark Douma LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MDTrackingView;

@interface MDAppController : NSObject <NSApplicationDelegate> {
	IBOutlet NSWindow			*window;
	IBOutlet MDTrackingView		*trackingView;
	IBOutlet MDTrackingView		*mouseMovedView;
}

- (IBAction)reset:(id)sender;

@end
