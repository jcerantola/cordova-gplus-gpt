#import "GooglePlus.h"

@implementation GooglePlus {
    GIDConfiguration *_gidConfig;
}

- (void)pluginInitialize {
    NSString *clientId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CLIENT_ID"];
    _gidConfig = [[GIDConfiguration alloc] initWithClientID:clientId];
}

- (void)login:(CDVInvokedUrlCommand *)command {
    __weak typeof(self) weakSelf = self;
    [GIDSignIn.sharedInstance signInWithConfiguration:_gidConfig presentingViewController:self.viewController callback:^(GIDGoogleUser * _Nullable user, NSError * _Nullable error) {
        CDVPluginResult *result;
        if (error) {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
        } else {
            NSDictionary *response = @{
                @"email": user.profile.email ?: @"",
                @"idToken": user.authentication.idToken ?: @"",
                @"serverAuthCode": user.serverAuthCode ?: @""
            };
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:response];
        }
        [weakSelf.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)logout:(CDVInvokedUrlCommand *)command {
    [GIDSignIn.sharedInstance signOut];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)trySilentLogin:(CDVInvokedUrlCommand *)command {
    __weak typeof(self) weakSelf = self;
    [GIDSignIn.sharedInstance restorePreviousSignInWithCallback:^(GIDGoogleUser * _Nullable user, NSError * _Nullable error) {
        CDVPluginResult *result;
        if (error || !user) {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No previous sign-in"];
        } else {
            NSDictionary *response = @{
                @"email": user.profile.email ?: @"",
                @"idToken": user.authentication.idToken ?: @"",
                @"serverAuthCode": user.serverAuthCode ?: @""
            };
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:response];
        }
        [weakSelf.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)disconnect:(CDVInvokedUrlCommand *)command {
    __weak typeof(self) weakSelf = self;
    [GIDSignIn.sharedInstance disconnectWithCallback:^(NSError * _Nullable error) {
        CDVPluginResult *result;
        if (error) {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
        } else {
            result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }
        [weakSelf.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    }];
}

- (void)isAvailable:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:YES];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (BOOL)handleURL:(NSURL *)url {
    return [[GIDSignIn sharedInstance] handleURL:url];
}

@end
