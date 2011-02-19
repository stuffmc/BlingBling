This is a sample code I use to demonstrate (in a more detailled way) how one can use the AddressBook API for iOS.

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

