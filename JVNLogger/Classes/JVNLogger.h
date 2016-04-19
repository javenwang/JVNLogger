//
//  JVNLogger.h
//  Pods
//
//  Created by Javen Wang on 4/17/16.
//
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, JVNLogFlag) {
    JVNLogFlagError = 1 << 0,
    JVNLogFlagWarning = 1 << 1,
    JVNLogFlagInfo = 1 << 2,
    JVNLogFlagDebug = 1 << 3,
    JVNLogFlagVerbose = 1 << 4
};

@interface JVNLogger : NSObject

+ (void)log:(BOOL)asynchronous
       flag:(JVNLogFlag)flag
    context:(NSInteger)context
       file:(const char *)file
   function:(const char *)function
       line:(NSUInteger)line
        tag:(id)tag
     format:(NSString *)format, ...;

@end

#define JVN_LOG_MACRO(isAsynchronous, flg, ctx, atag, fnct, frmt, ...) \
    do { \
        [JVNLogger log:isAsynchronous \
                  flag:flg \
               context:ctx \
                  file:__FILE__ \
              function:fnct \
                  line:__LINE__ \
                   tag:atag \
                format:(frmt), ##__VA_ARGS__]; \
    } while(0)

#ifndef LOG_ASYNC_ENABLED
#define LOG_ASYNC_ENABLED YES
#endif

#define JVNLogError(frmt, ...)   JVN_LOG_MACRO(NO,                JVNLogFlagError,   0, nil, __PRETTY_FUNCTION__, [NSString stringWithFormat:(frmt), ##__VA_ARGS__])
#define JVNLogWarn(frmt, ...)    JVN_LOG_MACRO(LOG_ASYNC_ENABLED, JVNLogFlagWarning, 0, nil, __PRETTY_FUNCTION__, [NSString stringWithFormat:(frmt), ##__VA_ARGS__])
#define JVNLogInfo(frmt, ...)    JVN_LOG_MACRO(LOG_ASYNC_ENABLED, JVNLogFlagInfo,    0, nil, __PRETTY_FUNCTION__, [NSString stringWithFormat:(frmt), ##__VA_ARGS__])
#define JVNLogDebug(frmt, ...)   JVN_LOG_MACRO(LOG_ASYNC_ENABLED, JVNLogFlagDebug,   0, nil, __PRETTY_FUNCTION__, [NSString stringWithFormat:(frmt), ##__VA_ARGS__])
#define JVNLogVerbose(frmt, ...) JVN_LOG_MACRO(LOG_ASYNC_ENABLED, JVNLogFlagVerbose, 0, nil, __PRETTY_FUNCTION__, [NSString stringWithFormat:(frmt), ##__VA_ARGS__])
