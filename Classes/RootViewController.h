//
//  RootViewController.h
//  InstantPayDemo
//
//  Created by StuFF mc on 2/19/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <AddressBook/AddressBook.h>
#import "PickerViewController.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {

@private
    NSFetchedResultsController *fetchedResultsController_;
    NSManagedObjectContext *managedObjectContext_;
	ABAddressBookRef ab;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) IBOutlet PickerViewController *pickerViewController;

- (IBAction)openURL;

@end
