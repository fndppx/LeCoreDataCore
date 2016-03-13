
//
//  TestCenterExtend.m
//  LeCoreDateCore
//
//  Created by keyan on 16/3/13.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "TestCenterExtend.h"
@interface TestCenterExtend()
@property (nonatomic, strong) Entity * entityModel;

@end
@implementation TestCenterExtend
static TestCenterExtend * userDBCenter;
+ (TestCenterExtend *)shareUserDBCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        userDBCenter = [[TestCenterExtend alloc] init];
    });
    return userDBCenter;
}

- (instancetype)init
{
    if(self = [super init]){
        [self loadUserModel];
    }
    return self;
}
- (NSURL *)modelURL{
    NSString * modelPath = [[NSBundle mainBundle] pathForResource:@"TestModel" ofType:@"momd"];
    NSURL * modelUrl = [NSURL URLWithString:modelPath];
    return modelUrl;
}

- (NSURL *)storeURL{
    NSString * dictionaryPath = [self storeDirectoryPath];
    NSString * storePath = [dictionaryPath stringByAppendingPathComponent:@"TestModel.sqlite"];
    NSURL * storeUrl = [NSURL fileURLWithPath:storePath];
    return storeUrl;
}

- (NSString *) entityName {
    return @"Entity";
}
#pragma mark - private method

- (void) loadUserModel
{
    NSFetchRequest* request=[[NSFetchRequest alloc] init];
    NSEntityDescription* userItemDataModelDescription = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:self.managedObjectContext];
    [request setEntity:userItemDataModelDescription];
    NSArray* fetchResultList = [self.managedObjectContext executeFetchRequest:request error:nil];
    if (fetchResultList.count > 0) {
        _entityModel = fetchResultList[0];
    }
}

- (BOOL)isBlankString:(NSString *)string
{
    if (string == nil || string == NULL){
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]){
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0){
        return YES;
    }
    return NO;
}

#pragma mark - public method

- (Entity *)userItemDataModel{
    return _entityModel;
}

- (void) fullFillUserItemDataModelWithUserItem {
    if (!_entityModel) {
        _entityModel = [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:self.managedObjectContext];
        [self saveContext];
    }
    _entityModel.name = @"haha";
    _entityModel.age = @"11";
    
    [self saveContext];
}



- (void) saveUserItemDataModel {
    [self saveContext];
}

- (void) removeUserItemDataModel {
    if (_entityModel!=nil) {
        [[self managedObjectContext] deleteObject:_entityModel];
        
    }
    _entityModel = nil;
    [self saveContext];
}



@end
