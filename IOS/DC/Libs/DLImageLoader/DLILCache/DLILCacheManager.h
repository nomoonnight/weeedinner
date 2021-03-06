//
//  DLILCacheManager.h
//
//  Created by Andrey Lunevich
//  Copyright 2013-2014 Andrey Lunevich. All rights reserved.

//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at

//  http://www.apache.org/licenses/LICENSE-2.0

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import <Foundation/Foundation.h>

@class DLILCache;

@interface DLILCacheManager : NSObject

/** Saves cache to file
 */
- (void)saveCache;

/** Add new image to cache
 @param image The image to cache
 @param url The key of the image
 */
- (void)addNewImageToCache:(NSData *)image url:(NSString *)url;

/** Delete image from cache
 @param url The key of the image
 */
- (void)deleteImageFromCache:(NSString *)url;

/** Get image from cache
 @param url The key of the image
 @return image from cache
 */
- (NSData *)imageFromCache:(NSString *)url;

@end