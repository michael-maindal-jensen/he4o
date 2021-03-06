//
//  SMGUtil+General.m
//  SMG_NothingIsAll
//
//  Created by jia on 2019/7/9.
//  Copyright © 2019年 XiaoGang. All rights reserved.
//

#import "SMGUtils+General.h"
#import "AIPointer.h"

@implementation SMGUtils (General)

//string
+(BOOL) strIsOk:(NSString*)s{
    return (s && ![s isKindOfClass:[NSNull class]] && [s isKindOfClass:[NSString class]] && ![s isEqualToString:@""]);
}
+(NSString*) strToOk:(NSString*)s{
    return (s && ![s isKindOfClass:[NSNull class]]) ? ([s isKindOfClass:[NSString class]] ? s : [NSString stringWithFormat:@"%@", s]) : @"";
}
+(NSArray*) strToArr:(NSString*)str sep:(NSString*)sep{
    str = STRTOOK(str);
    return [str componentsSeparatedByString:sep];
}
+(NSString*) codeLocateFormat:(NSString*)fileName line:(NSInteger)line{
    //1. 数据 准备
    fileName = STRTOOK(fileName);
    
    //2. 拼lineStr
    NSString *lineStr = STRFORMAT(@"%@%ld",(line > 999 ? @"" : ((line > 99 ? @" " : ((line > 9 ? @"  " : @"   "))))),(long)line);
    
    //3. 拼fileNameStr字符串
    NSString *fileNameStr = @"";
    NSInteger fileNameMax = 19;
    if (fileName.length > fileNameMax) {
        fileNameStr = STRFORMAT(@"%@..",[fileName substringToIndex:fileNameMax - 2]);
    }else{
        NSMutableString *prefix = [[NSMutableString alloc] init];
        for (NSInteger i = 0; i < fileNameMax - fileName.length; i++) {
            [prefix appendString:@" "];
        }
        fileNameStr = STRFORMAT(@"%@%@",prefix,fileName);
    }
    return STRFORMAT(@"%@%@",fileNameStr,lineStr);
}

//注: STRFORMAT目前的宏定义中,并没有多余调用,所以不需要单独封装出来;
//注2: 如果有一天要使用此代码,可以尝试1: SMGArrayMake()来转换array, 尝试2:直接传递format,...到stringWithFormat:
//#define STRFORMAT(s, ...) [SMGUtils strFormat:s, ##__VA_ARGS__]
//+(NSString*) strFormat:(NSString*)format, ...{
//    va_list paramList;
//    va_start(paramList,format);
//    NSString *result = [[NSString alloc]initWithFormat:format arguments:paramList];
//    result = [result stringByAppendingString:@"\n"];
//    va_end(paramList);
//    //return [NSString stringWithFormat:s...];
//    //return [NSString stringWithFormat:a, ##__VA_ARGS__];
//    return result;
//}

+(NSString*) subStr:(NSString*)s toIndex:(NSInteger)index{
    return (STRISOK(s) ? [s substringToIndex:MIN(s.length, MAX(0, index))] : @"");
}

//array
+(BOOL) arrIsOk:(NSArray*)a{
    return a && [a isKindOfClass:[NSArray class]] && a.count;
}
+(NSArray*) arrToOk:(NSArray*)a{
    return (a && [a isKindOfClass:[NSArray class]]) ? a : [NSArray new];
}
+(id) arrIndex:(NSArray*)a index:(NSInteger)i{
    return (a && [a isKindOfClass:[NSArray class]] && a.count > i) ? a[i] : nil;
}
+(id) arrTransIndex:(NSArray*)a index:(NSInteger)i{
    NSInteger index = ARRTOOK(a).count - 1 - i;
    return [self arrIndex:a index:index];
}
+(BOOL) arrIndexIsOk:(NSArray*)a index:(NSInteger)i{
    return (a && [a isKindOfClass:[NSArray class]] && a.count > i && i >= 0);
}
+(NSArray*) arrSub:(NSArray*)a start:(NSInteger)s length:(NSInteger)l{
    return (ARRISOK(a) ? [a subarrayWithRange:NSMakeRange(MAX(0, MIN(s,a.count)), MAX(0, MIN(a.count - s, l)))] : nil);
}

//number
+(BOOL) numIsOk:(NSNumber*)n{
    return (n && [n isKindOfClass:[NSNumber class]]);
}
+(NSNumber*) numToOk:(NSNumber*)n{
    return (n && [n isKindOfClass:[NSNumber class]]) ? n : @(0);
}

//dictionary
+(BOOL) dicIsOk:(NSDictionary*)d{
    return (d && [d isKindOfClass:[NSDictionary class]] && d.count);
}
+(NSDictionary*) dicToOk:(NSDictionary*)d{
    return (d && [d isKindOfClass:[NSDictionary class]]) ? d : [NSDictionary new];
}

//pointer (pointerId从0开始)
+(BOOL) pointerIsOk:(AIPointer*)p{
    return (p && [p isKindOfClass:[AIPointer class]] && p.pointerId >= 0);
}

//object
+(BOOL) isOk:(NSObject*)o class:(Class)c{
    return (o && [o isKindOfClass:c]);
}

//date
+(NSString*) date2HHMMSS{
    return [SMGUtils date2Str:@"HH:mm:ss"];
}
+(NSString*) date2HHMMSSSSS{
    return [SMGUtils date2Str:@"HH:mm:ss:SSS"];
}
+(NSString*) date2Str:(NSString*)format{
    NSDate *date = [NSDate new];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = format;
    return [fmt stringFromDate:date];
}

@end
