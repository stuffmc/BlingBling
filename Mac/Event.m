// 
//  Event.m
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import "Event.h"


@implementation Event 

@dynamic timeStamp;
@dynamic name;
@dynamic uniqueID;
@dynamic recordID;

- (void)awakeFromInsert {
	[self setTimeStamp:[NSDate date]];
}

@end
