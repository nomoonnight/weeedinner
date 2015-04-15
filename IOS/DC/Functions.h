//
//  functions.h
//  jarl-product
//
//  Created by Jaltech Europe GmbH on 28.05.14.
//  Copyright (c) 2014 Jaltech Europe GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Functions : NSObject

    
+ (NSString *)decodeHTMLEntities:(NSString *)string;

+ (NSString*) urlEncode :(NSString *)connection_url;

+ (NSMutableArray*)myAddObject:(NSString *)myid:(NSMutableArray*)muArray;

+ (NSString *) stringByStrippingHTML:(NSString *)string;

+ (NSString*)stringAfter:(NSString *)str;
    
@end
