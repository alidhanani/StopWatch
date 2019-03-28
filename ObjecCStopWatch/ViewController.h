//
//  ViewController.h
//  ObjecCStopWatch
//
//  Created by Ali Dhanani on 28/03/2019.
//  Copyright © 2019 Ali Dhanani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    int mili;
    int sec;
    int min;
    NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *lblMin;
@property (weak, nonatomic) IBOutlet UILabel *lblSec;
@property (weak, nonatomic) IBOutlet UILabel *lblMili;
- (IBAction)btnStart:(UIButton *)sender;
- (IBAction)btnStop:(UIButton *)sender;
- (IBAction)btnSplit:(UIButton *)sender;
- (IBAction)btnSReset:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSMutableString *strHistory;
@property (weak, nonatomic) NSMutableString *strMin;
@property (weak, nonatomic) NSMutableString *strSec;
@property (weak, nonatomic) NSMutableString *strMili;
@property (strong, nonatomic) NSMutableArray *strArray;

@end

