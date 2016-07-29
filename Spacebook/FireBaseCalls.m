//
//  FireBaseCalls.m
//  Spacebook
//
//  Created by Clyfford Millet on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//

#import "FireBaseCalls.h"

@implementation FireBaseCalls

-(void)postUser:(NSString*)name
{
    

    
    
    NSURL *url = [NSURL URLWithString:@"https://space-book-6eff8.firebaseio.com/USERS/.json"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
    
    
    NSDictionary *dictionary = @{@"name":@"Clyff",
                                 @"books":@"",
                                 @"id":@"" ,
                                 @"rating":@""};
    
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       // Handle response here
                                                                       NSLog(@"%@^^^^^^^^^^^^",response);
                                                                   }];
        
        // 5
        [uploadTask resume];
    }
}

-(void)postBookWithID:(NSString*)ID
{
    
    
    
    
    NSURL *url = [NSURL URLWithString:@"https://space-book-6eff8.firebaseio.com/USERS/.json"];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    // 2
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
        
    NSDictionary *dictionary = @{@"ImageName":@"",
                                 @"Title":@"",
                                 @"Author":@"" ,
                                 @"ISBN":@"",
                                 @"Description":@"",
                                 @"isHome":@0,
                                 @"bearer":@""};
    
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary
                                                   options:kNilOptions error:&error];
    
    if (!error) {
        // 4
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request
                                                                   fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                                                                       // Handle response here
                                                                       NSLog(@"%@^^^^^^^^^^^^",response);
                                                                   }];
        
        // 5
        [uploadTask resume];
    }
}

-(void)downloadData
{
NSURL *url = [NSURL URLWithString:@"https://space-book-6eff8.firebaseio.com/USERS/.json"];



// 2
NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                      dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                          // 4: Handle response here
                                          NSDictionary *jsonDicitonary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                          
                                          
                                          //create custom class and add data to array
//                                          CloudData *cloudMetaData = [[CloudData alloc]init];
//                                          cloudMetaData.hashKey = key;
//                                          cloudMetaData.fileName = [subDictionary objectForKey:@"fileName"];
//                                          cloudMetaData.likes = [subDictionary objectForKey:@"likes"];
//                                          cloudMetaData.timeStamp = [subDictionary objectForKey:@"timeStamp"];
                                          
                                          
                                      }];

// 3
[downloadTask resume];
}

@end
