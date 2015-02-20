//
//  ParkingService.m
//  WheresMyCar
//
//  Created by Pho Diep on 2/19/15.
//  Copyright (c) 2015 Pho Diep. All rights reserved.
//

#import "ParkingService.h"
#import "CoreDataStack.h"

@interface ParkingService ()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation ParkingService

+(id)sharedService {
    static ParkingService *mySharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mySharedService = [[self alloc] init];
    });
    return mySharedService;
}

-(instancetype)init {
    self = [super init];
    if (self) {
        self.coreDataStack = [[CoreDataStack alloc] init];
        self.context = self.coreDataStack.managedObjectContext;
    }
    return self;
}

-(Park *)addNewParking:(CLLocationCoordinate2D)location timestamp:(NSDate *)timestamp notes:(NSString *)notes images:(NSArray *)images {
    Park *parking = [NSEntityDescription insertNewObjectForEntityForName:@"Park" inManagedObjectContext:self.context];
    parking.latitude = [NSNumber numberWithDouble:location.latitude];
    parking.longitude = [NSNumber numberWithDouble:location.longitude];
    parking.timestamp = timestamp;
    parking.notes = notes;
    parking.picture1 = images[0];
    parking.picture2 = images[1];
    
    NSError *saveError;
    [self.context save:&saveError];
    
    if (saveError == nil) {
        return parking;
    }
    NSLog(@"save error ... %@", saveError.localizedDescription);
    return nil;
}

-(void)removeParking:(Park *)park {
    [self.context deleteObject:park];

    NSError *saveError;
    [self.context save:&saveError];

    if (saveError != nil) {
        NSLog(@"save error ... %@", saveError.localizedDescription);
    }

}

@end
