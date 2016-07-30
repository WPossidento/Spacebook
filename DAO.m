//
//  DAO.m
//  Spacebook
//
//  Created by Thomas on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//

#import "DAO.h"

@implementation DAO

+ (instancetype)sharedInstance {
  static DAO *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self alloc] customInit];
  });
  return sharedInstance;
}

- (instancetype)customInit {
  if (self == [super init]) {
    self.booksForUser = [NSMutableArray array];
    self.model = [NSManagedObjectModel mergedModelFromBundles:nil];       //  Create Object Model for schema
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.model];
    NSString *path = [self archivePath];                                  //  Create context
    //    NSLog(@"%@", path);
    NSURL *storeUrl = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
      [NSException raise:@"Failed to open" format:@"Reason: %@", [error localizedDescription]];
    }
    self.context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    [[self context]setPersistentStoreCoordinator:persistentStoreCoordinator];
  }
  [self initWithHardcodedValues];
  [self fetchDataFromContext];
  return self;
}

- (void)initWithHardcodedValues {
  User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.context];
  [user setValue:@"Kurt" forKey:@"name"];
  [user setValue:[NSNumber numberWithInt:2] forKey:@"userID"];
  [user setTotalRatingStars:[NSNumber numberWithDouble:500]];
  [user setTotalPeopleRated:[NSNumber numberWithDouble:100]];
  Book *book = (Book *)[NSEntityDescription insertNewObjectForEntityForName:@"Books" inManagedObjectContext:self.context];
  [book setTitle:@"Slaughterhouse IV"];
  [book setCoverImage:@"s5img"];
  [book setAuthor:@"Kurt Vonnegut"];
  [book setIsbn:[NSNumber numberWithDouble:123456789]];
  [book setIsHome:@YES];
  [book setBearer:user.name];
  [user addBookObject:book];
  NSLog(@"%@",book);
}

- (NSString *)archivePath {
  NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [documentsDirectories objectAtIndex:0];
  return [documentsDirectory stringByAppendingPathComponent:@"store.data"];
}

- (void)fetchDataFromContext {
  NSFetchRequest *request = [[NSFetchRequest alloc]init];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name MATCHES '.*'"];
  [request setPredicate:predicate];
  NSSortDescriptor *sortByName = [[NSSortDescriptor alloc]initWithKey:@"userID" ascending:YES];
  [request setSortDescriptors:[NSArray arrayWithObject:sortByName]];
  NSEntityDescription *entity = [[[self model] entitiesByName] objectForKey:@"User"];
  [request setEntity:entity];
  NSError *error = nil;
  NSArray *result = [[self context] executeFetchRequest:request error:&error];
  if (!result) {
    NSLog(@"Error fetching objects: %@\n%@", [error localizedDescription], [error userInfo]);
    abort();
  }
  [self createArrayOfBooksForUser:[result firstObject]];
}

- (void)createArrayOfBooksForUser:(User *)user {
  for (Book *book in user.book) {
    [self.booksForUser addObject:book];
  }
}

- (void)addNewBook:(Book *)book {
  book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.context];
  [book setTitle:book.name];
  [book setCoverImage:book.coverImage];
  [book setAuthor:book.author];
  [book setIsbn:book.isbn];
  [book setBearer:book.bearer];
  [book setIsHome:book.isHome];
  [self saveChanges];
  [self.booksForUser addObject:book];
}

- (void)saveChanges {
  NSError *err = nil;
  BOOL successful = [[self context] save:&err];
  if(!successful) {
    NSLog(@"Error saving: %@", [err localizedDescription]);
  }
  NSLog(@"data saved");
}

- (void)calculateUserRating:(double)newRating {
  double adjustedTotalStars = [self.currentUser.totalRatingStars doubleValue] + newRating;
  double adjustedPeopleRated = [self.currentUser.totalPeopleRated doubleValue] + 1;
  [self.currentUser setTotalRatingStars:[NSNumber numberWithDouble:adjustedTotalStars]];
  [self.currentUser setTotalPeopleRated:[NSNumber numberWithDouble:adjustedPeopleRated]];
  [self saveChanges];
}

@end
