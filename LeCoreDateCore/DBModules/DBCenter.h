//
//  DBCenter.h
//  LeCoreDateCore
//
//  Created by keyan on 16/3/13.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface DBCenter : NSObject
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *) modelURL;    //need to be overwrite
- (NSURL *) storeURL;    //need to be overwrite
- (NSString *) storeDirectoryPath;
- (NSString *) entityName;
- (void) saveContext;
@end
