//
//  Data.m
//  Plain Notes
//
//  Created by Emilia Kirschenbaum on 12/12/13.
//  Copyright (c) 2013 Spark Networks. All rights reserved.
//

#import "Data.h"
#import "Constants.h"
#import "MasterViewController.h"

@implementation Data

static NSMutableDictionary *allNotes;
static NSString *currentKey;


+(NSMutableDictionary *)getAllNotes{
    if (allNotes == nil){
        allNotes = [[NSMutableDictionary alloc] initWithDictionary:[[NSUserDefaults standardUserDefaults] dictionaryForKey:kAllNotes]];
    }
    
    
    return allNotes;
}

+(void)setCurrentKey:(NSString *)key{
    currentKey = key;
}

+(NSString *)getCurrentKey{
    return currentKey;
}

+(void)setNoteForCurrentKey: (NSString *)note{
    [self setNote:note forKey:currentKey];
}

+(void)setNote:(NSString *)note forKey:(NSString *)key{
    [allNotes setObject:note forKey:key];
}

+(void)saveNotes{
    [[NSUserDefaults standardUserDefaults]setObject:allNotes forKey:kAllNotes];
    [[NSUbiquitousKeyValueStore defaultStore]setObject:allNotes forKey:kAllNotes];
}

+(void)removeObjectForKey:(NSString *)key{
    [allNotes removeObjectForKey:key];
}

+ (void)dataUpdatedFromCloud:(NSNotification *)notification{
    NSDictionary *cloudData = [[NSUbiquitousKeyValueStore defaultStore] dictionaryForKey:kAllNotes];
    allNotes=[[NSMutableDictionary alloc]initWithDictionary:cloudData];
    [[MasterViewController masterView]reload];
}

@end
