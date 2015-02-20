//
//  HistoryViewController.m
//  WheresMyCar
//
//  Created by Pho Diep on 2/19/15.
//  Copyright (c) 2015 Pho Diep. All rights reserved.
//

#import "HistoryViewController.h"
#import "ParkingService.h"
#import "Park.h"
#import "HistoryCell.h"

@interface HistoryViewController () <UITableViewDataSource>

@property (strong, nonatomic) ParkingService *parkingSerivce;
@property (strong, nonatomic) NSManagedObjectContext *context;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *parking;

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.parkingSerivce = [ParkingService sharedService];
    self.context = [[self.parkingSerivce coreDataStack] managedObjectContext];

    self.tableView.dataSource = self;
    [self fetchParkingHistory];
    
}

- (void)fetchParkingHistory {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Park"];
    NSError *fetchError;
    NSArray *results = [self.context executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError == nil) {
        NSSortDescriptor *timeSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:false];
        self.parking = [results sortedArrayUsingDescriptors:@[timeSortDescriptor]];
        [self.tableView reloadData];
    }
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HistoryCell *cell = (HistoryCell*)[self.tableView dequeueReusableCellWithIdentifier:@"HISTORY_CELL" forIndexPath:indexPath];
    
    Park *park = self.parking[indexPath.row];
    
    cell.image.image = [UIImage imageWithData:park.picture1];
    cell.detailsText.text = park.notes;
    
    cell.timestampLabel.text = @"timestamp goes here";
//    cell.timestampLabel.text = park.timestamp;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.parking count];
}


@end
