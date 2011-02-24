//
//  WindowController.h
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AddressBook/AddressBook.h>
#import <AddressBook/ABPeoplePickerView.h>
#import <WebKit/WebKit.h>

@interface WindowController : NSWindowController <NSComboBoxDataSource, NSComboBoxDelegate, NSTableViewDelegate> {
}

@property (retain) ABAddressBook *ab;
@property (retain) NSMutableArray *people;

@property (retain) IBOutlet NSArrayController *arrayController;
@property (retain) IBOutlet NSComboBox *contactsComboBox;

@property (retain) IBOutlet NSTextField *contactsCountLabel;
@property (retain) IBOutlet NSTextField *emailLabel;
@property (retain) IBOutlet WebView *webView;

@property (retain) IBOutlet NSPanel *panel;
@property (retain) IBOutlet ABPeoplePickerView *peoplePickerView;

@property (retain) IBOutlet NSButton *addButton;

- (IBAction)pickPerson:(id)sender;
- (IBAction)addPerson:(id)sender;

@end
