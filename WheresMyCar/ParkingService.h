//
//  ParkingService.h
//  WheresMyCar
//
//  Created by Pho Diep on 2/19/15.
//  Copyright (c) 2015 Pho Diep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataStack.h"
#import "Park.h"
#import <CoreLocation/CoreLocation.h>

@interface ParkingService : NSObject

@property (strong, nonatomic) CoreDataStack *coreDataStack;

+(id)sharedService;

-(Park*)addNewParking:(CLLocationCoordinate2D)location timestamp:(NSDate*)timestamp notes:(NSString*)notes images:(NSArray*)images;
-(void)removeParking:(Park *)park;


@end
