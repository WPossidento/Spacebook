//
//  Book+CoreDataProperties.m
//  Spacebook
//
//  Created by Thomas on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book+CoreDataProperties.h"

@implementation Book (CoreDataProperties)

@dynamic coverImage;
@dynamic title;
@dynamic author;
@dynamic isbn;
@dynamic isHome;
@dynamic bearer;
@dynamic owner;

@end
