//
//  MyLanEducateMeViewController.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLanEducateMeCellTableViewCell.h"
#import "MyLanEducateMeDetailViewController.h"

@interface MyLanEducateMeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)IBOutlet UITableView * educateMeTableView;
@end
