//
//  DAO.h
//  Spacebook
//
//  Created by Thomas on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "User.h"
#import "Book.h"

@interface DAO : NSObject

@property (nonatomic, retain) NSMutableArray *booksForUser;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (nonatomic, retain) NSManagedObjectModel *model;
@property (nonatomic, retain) User *currentUser;

+ (instancetype)sharedInstance;
- (instancetype)customInit;
- (void)addNewBook:(Book *)book;

@end
