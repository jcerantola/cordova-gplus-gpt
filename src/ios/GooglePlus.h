#import <Cordova/CDVPlugin.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface GooglePlus : CDVPlugin
- (void)login:(CDVInvokedUrlCommand *)command;
- (void)logout:(CDVInvokedUrlCommand *)command;
- (void)trySilentLogin:(CDVInvokedUrlCommand *)command;
- (void)disconnect:(CDVInvokedUrlCommand *)command;
- (void)isAvailable:(CDVInvokedUrlCommand *)command;
- (BOOL)handleURL:(NSURL *)url;
@end
