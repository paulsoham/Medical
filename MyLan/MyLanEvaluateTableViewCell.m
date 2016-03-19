//
//  MyLanEvaluateTableViewCell.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEvaluateTableViewCell.h"

@implementation MyLanEvaluateTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    /*
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor lightGrayColor]CGColor], nil];
    [self.gradientView.layer addSublayer:gradient];
     */

}
-(void)selectOption:(BOOL)yesOrNo{
    if (yesOrNo) {
        self.checkLabel.text =  @"\u2713";
    }else{
        self.checkLabel.text = nil;
    }
}

@end
