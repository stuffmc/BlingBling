//
//  WindowController.m
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import "WindowController.h"


@implementation WindowController

@synthesize ab=ab_, people=people_, contactsCountLabel=_contactsCountLabel, contactsComboBox=contactsComboBox_, arrayController=arrayController_, emailLabel=emailLabel_, webView=webView_, panel=panel_, peoplePickerView=peoplePickerView_, addButton=addButton_;

- (void)loadPeople {
	ABGroup *group = [[ab_ groups] lastObject];
	people_ = [[group members] mutableCopy];
}

- (IBAction)pickPerson:(id)sender {
	[panel_ orderFrontRegardless];
}

- (IBAction)addPerson:(id)sender {
	[people_ addObjectsFromArray:[[self peoplePickerView] selectedRecords]];
	[contactsComboBox_ reloadData];
}

- (void)blingedFromPlugin:(NSNotification*)note {
	NSString *uniqueID = [[note userInfo] valueForKey:@"ABPerson"];
	ABRecord *record = [ab_ recordForUniqueId:uniqueID];
	
		
	if (record) {
		NSInteger index = [people_ indexOfObject:record];
		if (index != NSNotFound) {
			NSLog(@"index: %d", index);
			[[self contactsComboBox] selectItemAtIndex:index];
			[addButton_ performClick:nil];
		}
	}
	NSLog(@"Person blinged: %@", uniqueID);
}

- (void)awakeFromNib {
	NSLog(@"%s", _cmd);
	ab_ = [ABAddressBook sharedAddressBook];
	[self loadPeople];
	[peoplePickerView_ setNameDoubleAction:@selector(addPerson:)];
	NSString *contactCount = [NSString stringWithFormat:@"%d Contacts", [people_ count]];
	[_contactsCountLabel setStringValue:contactCount];
	NSLog(@"%@", contactCount);
//	id person = [people_ lastObject];
//	NSLog(@"%@ ::: %@", [person valueForProperty:kABFirstNameProperty], person);
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dbChanged:) name:kABDatabaseChangedExternallyNotification object:nil];
//	[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(blingedFromPlugin:) name:@"BlingNotification" object:nil];
	[[NSDistributedNotificationCenter defaultCenter] addObserver:self selector:@selector(blingedFromPlugin:) name:nil object:nil];
}

- (void)dbChanged:(NSNotification*)note {
	NSLog(@"%s %@", _cmd, note);
	[self loadPeople];
	[contactsComboBox_ reloadData];
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
	NSString *name = [managedObject valueForKey:@"name"];
	if (name) {
		[[self contactsComboBox] setStringValue:name];
	}
	NSString *uniqueID = [managedObject valueForKey:@"uniqueID"];
	if (uniqueID) {
		ABRecord *record = [ab_ recordForUniqueId:uniqueID];
		if (record) {
			ABMultiValue *multiValueEmail = [record valueForProperty:kABEmailProperty];			
			if ([multiValueEmail count]) {
				[emailLabel_ setStringValue:[multiValueEmail valueAtIndex:0]];
			}
			ABMultiValue *multiValueURL = [record valueForProperty:kABURLsProperty];
			if ([multiValueURL count]) {
				id url = [multiValueURL valueAtIndex:0];
				[webView_ setMainFrameURL:url];
			}
		}
	}
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
