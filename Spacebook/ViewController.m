//
//  ViewController.m
//  Spacebook
//
//  Created by Macbook Pro on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//

#import "ViewController.h"
#import "DAO.h"

@interface ViewController  ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  [DAO sharedInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
