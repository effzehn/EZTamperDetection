//
//  ViewController.m
//  EZTamperDetection
//
//  Created by Developer on 24.02.16.
//  Copyright © 2016 Andre Hoffmann. All rights reserved.
//

#import "ViewController.h"
#import "EZTInvestigator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performCheck];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)performCheck {
    EZTInvestigator *investigator = [EZTInvestigator new];
    [investigator start];
    
    EZTInvResult result = investigator.result;
    
    self.stat1.text = (result & EZTInvResultSBCmp) ? @"Sandbox compromised" : @"Sandbox unsuspicious";
    self.stat2.text = (result & EZTInvResultFSCmp) ? @"Filesystem compromised!" : @"Filesystem unsuspicious";
    self.stat3.text = (result & EZTInvResultApCmp) ? @"Application directory compromised!" : @"Application directory unsuspicious";
    self.stat4.text = (result & EZTInvResultDyCmp) ? @"Suspicious libraries found!": @"No suspicious libraries found";
}

@end
