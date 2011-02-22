//
//  WindowController.m
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import "WindowController.h"


@implementation WindowController

@synthesize ab=ab_, people=people_, contactsCountLabel=_contactsCountLabel;

- (void)awakeFromNib {
	NSLog(@"%s", _cmd);
	ab_ = [ABAddressBook sharedAddressBook];
	ABGroup *group = [[ab_ groups] lastObject];
	people_ = [[group members] mutableCopy];
	NSString *contactCount = [NSString stringWithFormat:@"%d Contacts", [people_ count]];
	[_contactsCountLabel setStringValue:contactCount];
	NSLog(@"%@", contactCount);
}

@end
