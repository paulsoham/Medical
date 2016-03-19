//
//  MyLanEvaluateMeViewController.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEvaluateMeViewController.h"
#import "MyLanAppDelegate.h"
#import "Question.h"
#import "QuestionOption.h"
#import "MyLanUtility.h"

static NSString *ML_EVALUATE_CELL_ID = @"CellId";

@interface MyLanEvaluateMeViewController ()

@end

@implementation MyLanEvaluateMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"Evaluate ME";
//    [self.questionAnsOptionList registerClass:[MyLanEvaluateTableViewCell class] forCellReuseIdentifier:@"CellId"];
    self.questionAnsOptionList.delegate = self;
    self.questionAnsOptionList.dataSource = self;
    self.questionImageView.image =[UIImage imageNamed:@"no-image-box"];
    [self renderJSON];

    [self fetchRecord];
}
-(void)renderJSON{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"evaluateme" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error =  nil;
    NSDictionary *jsonDataArray = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    self.questionDictionary = jsonDataArray;
    
   
    if (self.questionDictionary) {
        NSMutableArray * questionsArray = [self.questionDictionary objectForKey:@"quiz_questions"];
        if ([questionsArray count] > 0) {
            MyLanAppDelegate *app = (MyLanAppDelegate*)[[UIApplication sharedApplication] delegate];
            NSManagedObjectContext* context = app.managedObjectContext;
            
            for (NSDictionary *quesDict in questionsArray) {
                Question *ques = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Question class]) inManagedObjectContext:context];
                [ques setQuestion_id:quesDict[@"question_id"]];
                [ques setQuestion_description:quesDict[@"question_description"]];
                [ques setQuestion_image:quesDict[@"question_image"]];
                [ques setAnswer_id:quesDict[@"answer_id"]];
                [ques setQuestion_title:quesDict[@"question_title"]];
                NSMutableSet *tmpSet = [NSMutableSet new];
                for (NSDictionary *ops in quesDict[@"options"]) {
                    QuestionOption *quesOps = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([QuestionOption class]) inManagedObjectContext:context];
                    [quesOps setOption_id:ops[@"option_id"]];
                    [quesOps setOption_detail:ops[@"option_detail"]];
                    [quesOps setOrder:ops[@"order"]];
                    [tmpSet addObject:quesOps];
                }
                [ques setQuesOptions:tmpSet];

            }
            NSError *errors;
            if (![context save:&errors]) {
                NSLog(@"Failed to save - error: %@", [errors localizedDescription]);
            }
        }else{
            return;
        }
    }else{
        return;
    }
    
    

    
    
    
}

-(void)fetchRecord{
    
    MyLanAppDelegate *app = (MyLanAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = app.managedObjectContext;
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
       // NSLog(@"%@", result);
    }
    
    if (result.count > 0) {
        Question *question = (Question *)[result objectAtIndex:1];
       // NSLog(@"-->> %@", question.question_description);

        self.questionViewLbl.text = question.question_description;

    }
    [self.questionAnsOptionList reloadData];
    

    
}
- (void)viewDidAppear:(BOOL)animated
{
    // Kick off a timer to count it down
}

#pragma mark - UITableViewDatasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:ML_EVALUATE_CELL_ID forIndexPath:indexPath];
        [self setUpCell:cell atIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
   // cell.backgroundColor = [UIColor greenColor];
    return cell;
}



# pragma mark - Cell Setup

- (void)setUpCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[MyLanEvaluateTableViewCell class]]) {
        MyLanEvaluateTableViewCell *evaluateCell = (MyLanEvaluateTableViewCell*) cell;
        evaluateCell.questionLabel.text = @"Hola";
        [evaluateCell selectOption:YES];

    }else{
    
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    static MyLanEvaluateTableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        cell = [self.questionAnsOptionList dequeueReusableCellWithIdentifier:ML_EVALUATE_CELL_ID];
    });
    
    [self setUpCell:cell atIndexPath:indexPath];
    
    return [self calculateHeightForConfiguredSizingCell:cell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
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
