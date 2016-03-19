//
//  MyLanEvaluateMeViewController.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MyLanEvaluateTableViewCell.h"

@interface MyLanEvaluateMeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
   
}
@property (nonatomic,strong)IBOutlet UIImageView * questionImageView;
@property (nonatomic,strong)IBOutlet UILabel * questionViewLbl;
@property (nonatomic,strong)IBOutlet UITableView * questionAnsOptionList;
@property (nonatomic,strong) NSDictionary * questionDictionary;

@end
