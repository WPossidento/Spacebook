//
//  User+CoreDataProperties.h
//  Spacebook
//
//  Created by Thomas on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) NSNumber *totalRatingStars;
@property (nullable, nonatomic, retain) NSNumber *totalPeopleRated;
@property (nullable, nonatomic, retain) NSSet<Book *> *book;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addBookObject:(Book *)value;
- (void)removeBookObject:(Book *)value;
- (void)addBook:(NSSet<Book *> *)values;
- (void)removeBook:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
