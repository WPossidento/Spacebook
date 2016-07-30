//
//  Book+CoreDataProperties.h
//  Spacebook
//
//  Created by Thomas on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSString *bearer;
@property (nullable, nonatomic, retain) NSString *coverImage;
@property (nullable, nonatomic, retain) NSNumber *isbn;
@property (nullable, nonatomic, retain) NSNumber *isHome;
@property (nullable, nonatomic, retain) NSString *owner;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) User *user;

@end

NS_ASSUME_NONNULL_END
