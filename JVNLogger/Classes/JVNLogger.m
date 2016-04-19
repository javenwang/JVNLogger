//
//  JVNLogger.m
//  Pods
//
//  Created by Javen Wang on 4/17/16.
//
//

#import "JVNLogger.h"

static NSString * const kFeatureDetectClassName = @"DDLog";

// make compiler happy
@protocol JVNLogger_DDLog <NSObject>

+ (void)log:(BOOL)asynchronous
      level:(NSUInteger)level
       flag:(JVNLogFlag)flag
    context:(NSInteger)context
       file:(const char *)file
   function:(const char *)function
       line:(NSUInteger)line
        tag:(id)tag
     format:(NSString *)format, ...;

@end


@implementation JVNLogger

+ (void)log:(BOOL)asynchronous flag:(JVNLogFlag)flag context:(NSInteger)context file:(const char *)file function:(const char *)function line:(NSUInteger)line tag:(id)tag format:(NSString *)format, ...
{
    if (format) {
        va_list args;
        va_start(args, format);
        
        Class LogClass = NSClassFromString(kFeatureDetectClassName);
        if ([LogClass respondsToSelector:@selector(log:level:flag:context:file:function:line:tag:format:)]) {
            [LogClass log:asynchronous level:NSUIntegerMax flag:flag context:context file:file function:function line:line tag:tag format:format, args];
        } else {
            NSLog(format, args);
        }
        
        va_end(args);
    }
}

@end
