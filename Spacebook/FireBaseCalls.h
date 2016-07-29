//
//  FireBaseCalls.h
//  Spacebook
//
//  Created by Clyfford Millet on 7/29/16.
//  Copyright © 2016 William Possidento. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FireBaseCalls : NSObject

@property(strong, nonatomic)NSMutableArray *users;

-(void)postUser:(NSString*)name;
-(void)postBookWithID:(NSString*)ID;

@end
