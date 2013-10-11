//
//  MDTrackingView.m
//  Mouse Moved vs Tracking Areas
//
//  Created by Mark Douma on 10/31/2010.
//  Copyright 2010 Mark Douma LLC. All rights reserved.
//

#import "MDTrackingView.h"


const NSTimeInterval MDUpdateTimeInterval = 0.10;

@implementation MDTrackingView

@synthesize isHighlighted, highlightColor;

- (id)initWithFrame:(NSRect)frame {
    if (self = [super initWithFrame:frame]) {
		highlightColor = nil;
		time = 0.0;
		[self setHighlighted:NO];
    }
    return self;
}

- (void)dealloc {
	[highlightColor release];
	[super dealloc];
}

- (void)awakeFromNib {
	[self setHighlightColor:[NSColor greenColor]];
	NSTrackingArea *trackingArea = [[[NSTrackingArea alloc] initWithRect:[self visibleRect]
																 options:NSTrackingMouseEnteredAndExited | NSTrackingInVisibleRect |NSTrackingActiveAlways
																   owner:self
																userInfo:nil] autorelease];
	
	[self addTrackingArea:trackingArea];
}

- (void)reset {
	eventCount = 0;
	time = 0;
	[eventNameField setStringValue:@""];
	[eventCountField setStringValue:@""];
	[internalEventCountField setStringValue:@""];
	[timeField setStringValue:@""];
}

- (void)updateEventInfoWithEventName:(NSString *)eventName {
	[eventNameField setStringValue:eventName];
	[eventCountField setStringValue:[NSString stringWithFormat:@"%lu", eventCount]];
	[internalEventCountField setStringValue:[NSString stringWithFormat:@"%lu", eventCount]];
	
}


- (void)updateSeconds:(id)sender {
	if (isHighlighted) {
		time += MDUpdateTimeInterval;
		[timeField setStringValue:[NSString stringWithFormat:@"%0.3f sec", time]];
		[self performSelector:@selector(updateSeconds:) withObject:nil afterDelay:MDUpdateTimeInterval];
	}
}


- (void)mouseEntered:(NSEvent *)event {
	eventCount++;
	[self updateEventInfoWithEventName:NSStringFromSelector(_cmd)];
	[self setHighlighted:YES];
	[self performSelector:@selector(updateSeconds:) withObject:nil afterDelay:MDUpdateTimeInterval];
	[self setNeedsDisplay:YES];
}


- (void)mouseExited:(NSEvent *)event {
	eventCount++;
	[self updateEventInfoWithEventName:NSStringFromSelector(_cmd)];
	[self setHighlighted:NO];
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	[self setNeedsDisplay:YES];
}


- (void)drawRect:(NSRect)frame {
	[super drawRect:frame];
	[[NSColor whiteColor] set];
	[NSBezierPath fillRect:frame];
	if (isHighlighted) {
		[NSBezierPath setDefaultLineWidth:4.0];
		[highlightColor set];
		[NSBezierPath strokeRect:frame];
	}
}

@end




