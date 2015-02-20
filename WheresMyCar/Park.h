//
//  Park.h
//  WheresMyCar
//
//  Created by Pho Diep on 2/19/15.
//  Copyright (c) 2015 Pho Diep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Park : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSData * picture1;
@property (nonatomic, retain) NSData * picture2;

@end
