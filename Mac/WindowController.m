//
//  WindowController.m
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import "WindowController.h"


@implementation WindowController

@synthesize ab=ab_, people=people_, contactsCountLabel=_contactsCountLabel, contactsComboBox=contactsComboBox_, arrayController=arrayController_;

- (void)awakeFromNib {
	NSLog(@"%s", _cmd);
	ab_ = [ABAddressBook sharedAddressBook];
	ABGroup *group = [[ab_ groups] lastObject];
	people_ = [[group members] mutableCopy];
	NSString *contactCount = [NSString stringWithFormat:@"%d Contacts", [people_ count]];
	[_contactsCountLabel setStringValue:contactCount];
	NSLog(@"%@", contactCount);
//	id person = [people_ lastObject];
//	NSLog(@"%@ ::: %@", [person valueForProperty:kABFirstNameProperty], person);
}


- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox {
	return [people_ count];
}	

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index {
	ABPerson *person = [people_ objectAtIndex:index];
	NSString *compositeName = [NSString stringWithFormat:@"%@ %@", [person valueForProperty:kABFirstNameProperty], [person valueForProperty:kABLastNameProperty]];
//	NSLog(@"%@", compositeName);
	return compositeName;
}

//- (void)tableView:(NSTableView *)tableView did  ClickTableColumn:(NSTableColumn *)tableColumn {
//	NSLog(@"ds: %@", [tableView dataSource]);
//}
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
	NSManagedObject *managedObject = [[arrayController_ selectedObjects] lastObject];
	[contactsComboBox_ setStringValue:[managedObject valueForKey:@"name"]];
//	NSLog(@"dc: %@", managedObject);
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
	ABPerson *person = nil;
	NSInteger indexOfSelectedItem = [contactsComboBox_ indexOfSelectedItem];
	if (indexOfSelectedItem > -1) {
		person = [people_ objectAtIndex:indexOfSelectedItem];
		NSString *compositeName = [NSString stringWithFormat:@"%@ %@", [person valueForProperty:kABFirstNameProperty], [person valueForProperty:kABLastNameProperty]];
		NSManagedObject *managedObject = [[arrayController_ selectedObjects] lastObject];
		[managedObject setValue:[person valueForProperty:kABUIDProperty] forKey:@"uniqueID"];
		[managedObject setValue:compositeName forKey:@"name"];
	}
}

	//- (BOOL)tableView:(NSTableView *)aTableView shouldSelectRow:(NSInteger)rowIndex {
//	NSLog(@"ds: %@", [arrayController_ selectedObjects]);
//
//	return YES;
//}


//- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
//	NSLog(@"ds: %@", [[tableView col arrangedObjects]);
//}

@end
