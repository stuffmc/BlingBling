//
//  PickerViewController.h
//  BlingBling
//
//  Created by StuFF mc on 2/19/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>

@interface PickerViewController : UIViewController <UIPickerViewDelegate> {

}

@property (nonatomic, retain) UIPickerView *pickerView;
@property (nonatomic, retain) NSArray *people;

@end
