//
//  WindowController.m
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import "WindowController.h"


@implementation WindowController

@synthesize ab=ab_, people=people_;

- (void)awakeFromNib {
	NSLog(@"%s", _cmd);
	ab_ = [ABAddressBook sharedAddressBook];
	people_ = [[ab_ people] mutableCopy];
	NSLog(@"%d Contacts", [people_ count]);
}

@end
