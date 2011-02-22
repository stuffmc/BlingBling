//
//  Event.h
//  BlingBling
//
//  Created by StuFF mc on 2/22/11.
//  Copyright 2011 Pomcast.net. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Event :  NSManagedObject  
{
}

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * uniqueID;
@property (nonatomic, retain) NSNumber * recordID;

@end



