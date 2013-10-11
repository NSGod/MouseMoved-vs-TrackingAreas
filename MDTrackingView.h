//
//  MDTrackingView.h
//  Mouse Moved vs Tracking Areas
//
//  Created by Mark Douma on 10/31/2010.
//  Copyright 2010 Mark Douma LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MDTrackingView : NSView {
	IBOutlet NSTextField		*eventNameField;
	IBOutlet NSTextField		*eventCountField;
	IBOutlet NSTextField		*internalEventCountField;
	IBOutlet NSTextField		*timeField;
	
	NSUInteger					eventCount;
	NSTimeInterval				time;
	BOOL						isHighlighted;
	NSColor						*highlightColor;

}

@property (assign, setter=setHighlighted:) BOOL isHighlighted;
@property (retain) NSColor *highlightColor;

- (void)reset;

- (void)updateEventInfoWithEventName:(NSString *)eventName;

@end
