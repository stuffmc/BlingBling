//
//  BlingPlugin.m
//  BlingPlugin
//
//  Created by StuFF mc on 2/23/11.
//  Copyright Pomcast.net 2011. All rights reserved.
//

#import "BlingPlugin.h"

@implementation BlingPlugin

// This example action works with phone numbers.
- (NSString *)actionProperty
{
    return kABEmailProperty;
}

// Our menu title will look like Speak 555-1212
- (NSString *)titleForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    NSString* value = [person valueForProperty:kABFirstNameProperty];
    return [NSString stringWithFormat:@"Bling %@", value];    
}

// This method is called when the user selects your action. As above, this method
// is passed information about the data item rolled over.
- (void)performActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
	NSDictionary *dict = [NSDictionary dictionaryWithObject:[person uniqueId] forKey:@"ABPerson"];
	[[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"BlingNotification" object:@"OBJET" userInfo:dict];
}

// Optional. Your action will always be enabled in the absence of this method. As
// above, this method is passed information about the data item rolled over.
- (BOOL)shouldEnableActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    NSString* value = [person valueForProperty:kABFirstNameProperty];
    return [value isEqualToString:@"Manuel"];
}

@end
