//
//  YHXSoapFor5G.h
//  iphone1
//
//  Created by Zeng Yifei on 13-4-19.
//  Copyright (c) 2013年 KaiYan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YHXSoapAPI.h"
#import "YHXAppDelegate.h"

@interface YHXSoapFor5G : NSObject<NSXMLParserDelegate,  NSURLConnectionDelegate>
@property (strong, nonatomic) NSMutableData *webData;
@property (strong, nonatomic) NSMutableString *soapResults;

@property (strong, nonatomic) NSXMLParser *xmlParser;
@property (nonatomic) BOOL elementFound;
@property (strong, nonatomic) NSString *matchingElement;
@property (strong, nonatomic) NSString *matchingElement1;

@property (strong, nonatomic) NSURLConnection *conn;
@property (strong, nonatomic) NSMutableString *getXMLResults;

@property (strong, nonatomic) NSMutableString *soapResults1;
@property (nonatomic) BOOL elementFound1;
@property (strong, nonatomic) NSString *matchingElement2;
@property (strong, nonatomic) NSMutableString *soapResults2;
@property (nonatomic) BOOL elementFound2;


-(void)AuthenticateWithUserName:(NSString *)NewUsername Password:(NSString *)NewPassword AndPort:(NSString *)Port;
-(void)GetAPInfo :(id)NewRadio;
-(void)CofigurationStarted;
-(void)SetExtenderMode:(NSString *)NweExtenderMode :(NSString *)Nwe2GRadioMode :(NSString *)Nwe5GRadioMode :(NSString *)NweBondEthernet;
-(void)SetRouterWLANNoSecurity:(NSString *)NewRadio :(NSString *)NewSSID :(NSString *)NewChannel :(NSString *)NewWirelessMode :(id)NewVerify;
-(void)SetRouterWLANWEPByKeys:(NSString *)NewRadio :(NSString *)NewSSID :(NSString *)NewChannel :(NSString *)NewWirelessMode :(NSString *)NewWEPAuthType :(id)NewWEPLength :(id) NewKeyIndex :(NSString *) NewWEPPassphrase :(id)NewVerify;
-(void)SetRouterWLANWPAPSKByPassphrase:(NSString *)NewRadio :(NSString *)NewSSID :(NSString *)NewChannel :(NSString *)NewWirelessMode :(NSString *)NewWPAEncryptionModes :(NSString *) NewWPAPassphrase :(id)NewVerify;
-(void)SetWLANNoSecurity:(NSString *)NewRadio :(NSString *)NewSSID :(NSString *)NewChannel :(NSString *)NewWirelessMode;
-(void)SetWLANWEPByKeys:(NSString *)NewRadio :(NSString *)NewSSID :(NSString *)NewChannel :(NSString *)NewWirelessMode :(NSString *)NewWEPAuthType :(id)NewWEPLength :(id) NewKeyIndex :(NSString *) Newkey1 :(NSString *) Newkey2 :(NSString *) Newkey3 :(NSString *) Newkey4;
-(void)SetWLANWPAPSKByPassphrase:(NSString *)NewRadio :(NSString *)NewSSID :(NSString *)NewChannel :(NSString *)NewWirelessMode :(NSString *)NewWPAEncryptionModes :(NSString *) NewWPAPassphrase;
-(void)ConfigurationFinished;
-(void)SetEnable;
-(void)isExtender;

@end
