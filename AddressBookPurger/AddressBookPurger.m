//
//  AddressBookPurger.m
//  AddressBookPurger
//
//  Created by StuFF mc on 07.01.11.
//  Copyright Pomcast.net 2011. All rights reserved.
//

#import "AddressBookPurger.h"

@implementation AddressBookPurger

@synthesize ab, valueToSearch, peopleFound;

- (id)init {
	if (self = [super init]) {
		ab = [ABAddressBook sharedAddressBook];
		NSLog(@"%d Contacts", [[ab people] count]);
		NSLog(@"%d Groups", [[ab groups] count]);
	}
	return self;
	
	
	
}


	// This example action works with phone numbers.
- (NSString *)actionProperty
{
    return kABEmailProperty; //kABPhoneProperty;
}

	// Our menu title will look like Speak 555-1212
- (NSString *)titleForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
	
    ABMultiValue* values = [person valueForProperty:[self actionProperty]];
    NSString* value = [values valueForIdentifier:identifier];
	
    return [NSString stringWithFormat:@"Remove all references from '%@' in Address Book", value];    
}

	// This method is called when the user selects your action. As above, this method
	// is passed information about the data item rolled over.
- (void)performActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    ABMultiValue* values = [person valueForProperty:[self actionProperty]];
    self.valueToSearch = [values valueForIdentifier:identifier];
	
	ABSearchElement* searchElement = [ABPerson searchElementForProperty:[self actionProperty] label:nil key:nil value:valueToSearch comparison:kABEqual];
	self.peopleFound = [ab recordsMatchingSearchElement:searchElement];
	NSUInteger count = [peopleFound count];
	NSLog(@"%d Contacts with %@", count, valueToSearch);
	
	NSString *messageText = [NSString stringWithFormat:@"%d record%@ will be modified.", count, count == 1 ? @"" : @"s"];
	NSAlert *alert = [[NSAlert alloc] init];
	[alert setInformativeText:@"Are you sure you want to continue?"];
	[alert setMessageText:messageText];
	[alert addButtonWithTitle:@"No"];
	NSButton *yesButton = [alert addButtonWithTitle:@"Yes"];
	[yesButton setTarget:self];
	[yesButton setAction:@selector(yesButtonClicked:)];
	[alert beginSheetModalForWindow:[NSApp mainWindow] modalDelegate:nil didEndSelector:nil contextInfo:nil];
}

- (void)yesButtonClicked:(id)sender {
	NSLog(@"Yes clicked!");
	NSAlert *alert = sender;
	for (ABRecord *record in peopleFound) {
		ABMultiValue *multiValue = [record valueForProperty:kABPhoneProperty];
		for (int i = 0; i < [multiValue count]; i++) {
			if ([[multiValue valueAtIndex:i] isEqualToString:valueToSearch]) {
					//				NSLog(@"record: %@", [multiValue valueAtIndex:i]);
				ABMutableMultiValue *mutableMV = [multiValue mutableCopy];
				[mutableMV removeValueAndLabelAtIndex:i];
				[record setValue:mutableMV forProperty:kABPhoneProperty];
			}
		}
	}
	[ab save];
	NSLog(@"Done");
	[NSApp endSheet:[alert window]];
}

	// Optional. Your action will always be enabled in the absence of this method. As
	// above, this method is passed information about the data item rolled over.
- (BOOL)shouldEnableActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    return YES;
}

@end
