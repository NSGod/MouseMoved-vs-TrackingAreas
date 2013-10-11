//
//  MDMouseMovedView.m
//  Mouse Moved vs Tracking Areas
//
//  Created by Mark Douma on 10/31/2010.
//  Copyright 2010 Mark Douma LLC. All rights reserved.
//

#import "MDMouseMovedView.h"


@implementation MDMouseMovedView


- (void)awakeFromNib {
	[self setHighlightColor:[NSColor redColor]];
	NSTrackingArea *trackingArea = [[[NSTrackingArea alloc] initWithRect:[self visibleRect]
																	// feed in NSTrackingMouseMoved to get mouseMoved: events too
																 options:NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingInVisibleRect |NSTrackingActiveAlways
																   owner:self
																userInfo:nil] autorelease];
	
	[self addTrackingArea:trackingArea];

}


- (void)mouseMoved:(NSEvent *)event {
	eventCount++;
	[self updateEventInfoWithEventName:NSStringFromSelector(_cmd)];
	[self setNeedsDisplay:YES];
}


@end



