//
//  ExpCacheModel.h
//  SMG_NothingIsAll
//
//  Created by iMac on 2018/8/21.
//  Copyright © 2018年 XiaoGang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  MARK:--------------------解决经验model--------------------
 */
@interface ExpCacheModel : NSObject

@property (strong, nonatomic) AIPointer *exp_p;   //经验指针;
@property (strong, nonatomic) NSArray *outArr;      //输出信息;
@property (assign, nonatomic) CGFloat score;        //因mindHappy和urgentTo算出的可行性;//V2TODO:后续增加主观意志,对score的影响;从而使expCacheModel的思考更加灵活;

@end