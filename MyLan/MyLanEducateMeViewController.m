//
//  MyLanEducateMeViewController.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEducateMeViewController.h"

@interface MyLanEducateMeViewController ()
@property (nonatomic,strong)NSMutableArray * cellData;
@end

@implementation MyLanEducateMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Educate ME";
    self.educateMeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.cellData = [[NSMutableArray alloc]init];
    [self.cellData addObjectsFromArray:[NSArray arrayWithObjects:@"HIV/AIDS 101",@"Just Diagnosed",@"Prevention – Reduce your risk",@"Staying healthy",nil]];
}
#pragma mark - UITableViewDatasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"row->>%d",indexPath.row);
    
    NSString *CellIdentifier = @"EducateMeCellID";
    
    MyLanEducateMeCellTableViewCell *cell = (MyLanEducateMeCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        [cell.leftButton setTitle:NSLocalizedString([self.cellData objectAtIndex:indexPath.row], @"title") forState:UIControlStateNormal];
        [cell.rightButton setTitle:NSLocalizedString([self.cellData objectAtIndex:indexPath.row+1], @"title") forState:UIControlStateNormal];
    }else{
        [cell.leftButton setTitle:NSLocalizedString([self.cellData objectAtIndex:indexPath.row+1], @"title") forState:UIControlStateNormal];
        [cell.rightButton setTitle:NSLocalizedString([self.cellData objectAtIndex:indexPath.row+2], @"title") forState:UIControlStateNormal];
    }
    
    
    cell.leftButton.titleLabel.font = [UIFont systemFontOfSize:12];
    cell.leftButton.titleLabel.numberOfLines = 0;
    cell.leftButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    cell.rightButton.titleLabel.font = [UIFont systemFontOfSize:12];
    //[cell.rightButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0]];
    cell.rightButton.titleLabel.numberOfLines = 0;
    cell.rightButton.titleLabel.textAlignment = NSTextAlignmentCenter;


    
    [cell.leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.rightButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 250.0f;
}
-(void)leftButtonClick{
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*if ([[segue identifier] isEqualToString:@"MoveToEducateDetail"]) {
        MyLanEducateMeDetailViewController *tb = [segue destinationViewController];
        tb.productType = self.productType;
        tb.productFilterType = self.entityType;
        
        
    }*/
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
