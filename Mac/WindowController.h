//
//  WindowController.h
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AddressBook/AddressBook.h>

@interface WindowController : NSWindowController {
}

@property (retain) ABAddressBook *ab;
@property (retain) NSMutableArray *people;

@property (retain) IBOutlet NSTextField *contactsCountLabel;

@end
