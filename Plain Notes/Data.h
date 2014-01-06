//
//  Data.h
//  Plain Notes
//
//  Created by Emilia Kirschenbaum on 12/12/13.
//  Copyright (c) 2013 Spark Networks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
+(NSMutableDictionary *)getAllNotes;

+(void)setCurrentKey:(NSString *)key;

+(NSString *)getCurrentKey;

+(void)setNoteForCurrentKey: (NSString *)note;

+(void)setNote:(NSString *)note forKey:(NSString *)key;

+(void)saveNotes;

+(void)removeObjectForKey:(NSString *)key;

+ (void)dataUpdatedFromCloud:(NSNotification *)notification;

@end
