//
//  WindowController.m
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import "WindowController.h"


@implementation WindowController

@synthesize ab=ab_, people=people_, contactsCountLabel=_contactsCountLabel, contactsComboBox=contactsComboBox_;

- (void)awakeFromNib {
	NSLog(@"%s", _cmd);
	ab_ = [ABAddressBook sharedAddressBook];
	ABGroup *group = [[ab_ groups] lastObject];
	people_ = [[group members] mutableCopy];
	NSString *contactCount = [NSString stringWithFormat:@"%d Contacts", [people_ count]];
	[_contactsCountLabel setStringValue:contactCount];
	NSLog(@"%@", contactCount);
	id person = [people_ lastObject];
	NSLog(@"%@ ::: %@", [person valueForProperty:kABFirstNameProperty], person);
}


- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox {
	return [people_ count];
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index {
	ABPerson *person = [people_ objectAtIndex:index];
	NSString *compositeName = [NSString stringWithFormat:@"%@ %@", [person valueForProperty:kABFirstNameProperty], [person valueForProperty:kABLastNameProperty]];
	NSLog(@"%@", compositeName);
	return compositeName;
}

@end
