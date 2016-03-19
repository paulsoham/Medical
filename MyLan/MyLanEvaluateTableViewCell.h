//
//  MyLanEvaluateTableViewCell.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLanEvaluateTableViewCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel * questionLabel;
@property (nonatomic,strong)IBOutlet UILabel * checkLabel;
@property (nonatomic, strong) IBOutlet UIView *gradientView;
-(void)selectOption:(BOOL)yesOrNo;
@end
