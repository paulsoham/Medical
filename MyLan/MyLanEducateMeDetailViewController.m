//
//  MyLanEducateMeDetailViewController.m
//  MyLan
//
//  Created by SOHAM PAUL on 19/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEducateMeDetailViewController.h"

@interface MyLanEducateMeDetailViewController ()

@end

@implementation MyLanEducateMeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Educate Me Detail";
    
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

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
