//
//  NVView.h
//  SMG_NothingIsAll
//
//  Created by jia on 2019/6/11.
//  Copyright © 2019年 XiaoGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NVViewDelegate <NSObject>

//获取自定义节点view
-(UIView *)nv_GetCustomSubNodeView:(id)nodeData;

//获取节点颜色
-(UIColor *)nv_GetNodeColor:(id)nodeData;

//获取节点透明度
-(CGFloat)nv_GetNodeAlpha:(id)nodeData;

//获取节点描述
-(NSString*)nv_NodeOnClick:(id)nodeData;

//获取模块Id
-(NSArray*)nv_GetModuleIds;
-(NSString*)nv_GetModuleId:(id)nodeData;

//获取节点的被引用序列
-(NSArray*)nv_GetRefNodeDatas:(id)nodeData;

//获取节点的引用序列(内容)
-(NSArray*)nv_ContentNodeDatas:(id)nodeData;

//获取节点的抽象序列
-(NSArray*)nv_AbsNodeDatas:(id)nodeData;

//获取节点的具象序列
-(NSArray*)nv_ConNodeDatas:(id)nodeData;

//追加节点
-(void)nv_AddNodeOnClick;

//报名
-(NSString*)nv_ShowName:(id)data;

//获取节点指向target的强度
-(NSInteger)nv_GetPortStrong:(id)mainNodeData target:(id)targetNodeData;

@end

/**
 *  MARK:--------------------NetVision主view--------------------
 *  1. 默认为关闭状态,点"放开"时再展开窗口;
 */
@interface NVView : UIView

-(id) initWithDelegate:(id<NVViewDelegate>)delegate;

/**
 *  MARK:--------------------设置内容--------------------
 */
-(void) setNodeData:(id)nodeData;
-(void) setNodeDatas:(NSArray*)nodeDatas;
-(void) setNodeData:(id)nodeData lightStr:(NSString*)lightStr;
-(void) setNodeData:(id)nodeData appendLightStr:(NSString*)appendLightStr;

/**
 *  MARK:--------------------清空网络--------------------
 */
-(void) clear;

/**
 *  MARK:--------------------节点描述--------------------
 */
-(void) lightNode:(id)nodeData str:(NSString*)str;

/**
 *  MARK:--------------------线描述--------------------
 */
-(void) lightLine:(id)nodeDataA nodeDataB:(id)nodeDataB str:(NSString*)str;
-(void) lightLineStrong:(id)nodeDataA nodeDataB:(id)nodeDataB;

/**
 *  MARK:--------------------清空节点描述--------------------
 */
-(void) clearLight;
-(void) clearLight:(NSString*)moduleId;

/**
 *  MARK:--------------------获取节点描述--------------------
 */
-(NSString*) getLightStr:(id)nodeData;

@end

