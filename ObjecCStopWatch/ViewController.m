//
//  ViewController.m
//  ObjecCStopWatch
//
//  Created by Ali Dhanani on 28/03/2019.
//  Copyright © 2019 Ali Dhanani. All rights reserved.
//

#import "ViewController.h"
#import "DataTVC.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize strMili, strSec, strHistory, strMin, strArray, tableView, lblSec, lblMin, lblMili;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    strArray = [[NSMutableArray alloc] init];
    mili = 0;
    sec = 0;
    min = 0;
}

- (void)helpMethod {
    mili += 1;
    if (mili == 100) {
        mili = 0;
        sec += 1;
        if (sec == 60) {
            sec = 0;
            min += 1;
        }
    }
    if (mili<10) {
        strMili = [NSMutableString stringWithFormat:@"%i",mili];
    } else {
        strMili = [NSMutableString stringWithFormat:@"%i",mili];
    }
    if (sec<10) {
        strSec = [NSMutableString stringWithFormat:@"%i",sec];
    } else {
        strSec = [NSMutableString stringWithFormat:@"%i",sec];
    }
    if (min<10) {
        strMin = [NSMutableString stringWithFormat:@"%i",min];
    } else {
        strMin = [NSMutableString stringWithFormat:@"%i",min];
    }
    lblMili.text = strMili;
    lblMin.text = strMin;
    lblSec.text = strSec;
}

- (IBAction)btnStart:(UIButton *)sender {
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(helpMethod) userInfo:nil repeats:YES];
}
- (IBAction)btnStop:(UIButton *)sender {
    [timer invalidate];
}

- (IBAction)btnSplit:(UIButton *)sender {
    strHistory = [NSMutableString stringWithFormat:@"%@:%@:%@", strMin, strSec, strMili];
    [strArray addObject:strHistory];
    [tableView reloadData];
}
- (IBAction)btnSReset:(UIButton *)sender {
    [timer invalidate];
    lblMin.text = @"00";
    lblSec.text = @"00";
    lblMili.text = @"00";
    min = 0;
    sec = 0;
    mili = 0;
    [strArray removeAllObjects];
    [tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DataTVC *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.lblStr.text = [strArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [strArray count];
}

@end
