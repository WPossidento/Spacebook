//
//  ViewController.m
//  Spacebook
//
//  Created by Macbook Pro on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//

#import "ViewController.h"
#import "FireBaseCalls.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FireBaseCalls *fbc = [[FireBaseCalls alloc]init];
    
    [fbc postUser:@"Clyff"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
