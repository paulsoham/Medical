//
//  MyLanEducateMeCellTableViewCell.m
//  MyLan
//
//  Created by SOHAM PAUL on 19/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEducateMeCellTableViewCell.h"

@implementation MyLanEducateMeCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.leftButton.layer.cornerRadius = 55;
    self.leftButton.layer.borderWidth = 2;
    self.leftButton.layer.borderColor = [[UIColor grayColor]CGColor];
    
    
    self.rightButton.layer.cornerRadius = 55;
    self.rightButton.layer.borderWidth = 2;
    self.rightButton.layer.borderColor = [[UIColor grayColor]CGColor];


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
