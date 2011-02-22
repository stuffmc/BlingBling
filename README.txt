This is a sample code I use to demonstrate (in a more detailled way) how one can use the AddressBook API for iOS & Mac OS.

DEMO 1
======
Step 1: 

- Starting from "Navigation Based Core Data Backed App" Xcode template
- Added "name" & "recordID" to the "Event" Entity.
- Formatting timeStamp to only see time, and added "name" (in the TableViewCell)
- UIPickerView in the TableHeader for showing (later) the list of Friends ("Contacts") that will owe me money.

Step 2:

- Add the AB Framework + #import
- Add an ivar for ABAddressBookRef
- @property NSArray for ABAddressBookCopyPeopleWithName (in RootVC)
- use this array for the Picker and display the name

Step 3: Get the selected Contact (ABRecord) in the Picker, save his name & recordID in Core Data


DEMO 2
======
Step 4: Add an accessory button on the right of the Picker to open the first URL associated with a contact.
Step 5: When adding a record (a bling), save a message (Bling on "date") in the Notes field.
Step 6: Also add a URL (http://paypal.com) to the list of URLs for this person.


DEMO 3
======
Step 7: Add UI Framework. Show a PersonViewController when selecting a row.

DEMO 4
======
Step 8: When clicking on the "+" button in the PickerView, use a newPersonViewController to add a person and refresh the list

DEMO 5
======
Step 9: Change the "+" into an ActionSheet that give the option between adding a new person or selecting from the address book, and thus show the PeoplePicker and when selecting a person, add it to the PickerView.

DEMO 6
======
Step 10: Refresh the PickerView when a new record is added on the Address Book while the app is open!


DEMO MAC 1
==========

Step 1: Do a Core Data Based Mac App based on the same Core Data and add an "Entity" in IB, to show in a NSTableView + show the number of total contacts (NSLog)

Step 2: Select the "last" group, and it's members, and display the count in a label in the UI (before the search box)

