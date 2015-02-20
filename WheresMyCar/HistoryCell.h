//
//  HistoryCell.h
//  WheresMyCar
//
//  Created by Pho Diep on 2/19/15.
//  Copyright (c) 2015 Pho Diep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Park.h"

@interface HistoryCell : UITableViewCell

@property (strong, nonatomic) Park *park;

@property (strong, nonatomic) IBOutlet UILabel *timestampLabel;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UITextView *detailsText;

@end
