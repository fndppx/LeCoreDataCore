//
//  TestCenterExtend.h
//  LeCoreDateCore
//
//  Created by keyan on 16/3/13.
//  Copyright © 2016年 keyan. All rights reserved.
//

#import "DBCenter.h"
#import "Entity.h"
@interface TestCenterExtend : DBCenter
+ (TestCenterExtend *)shareUserDBCenter;

- (Entity *) userItemDataModel;
- (void) fullFillUserItemDataModelWithUserItem;
- (void) saveUserItemDataModel;
- (void) removeUserItemDataModel;
@end
