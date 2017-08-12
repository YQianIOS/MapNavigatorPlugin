//
//  MapNavigator.m
//  新家装通
//
//  Created by yizhiton on 2017/7/18.
//
//

#import "MapNavigator.h"
#import <CoreLocation/CoreLocation.h>

@implementation MapNavigator

- (void)baiMapNavigatorMethod:(CDVInvokedUrlCommand *)command{
    NSString * resultStr = @"true";
    NSString * callBackID = command.callbackId;
    NSString * addressStr = [command.arguments objectAtIndex:0];
    //百度地图
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]]) {
        
        NSString * urlString = [[NSString stringWithFormat:@"baidumap://map/geocoder?address=%@&src=webapp.geo.yzt.jzt",addressStr] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        
        /*
       //  地图返编码
        CLGeocoder * geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:addressStr completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            for (CLPlacemark * placemark in placemarks) {
                // 坐标 (经纬度)
                CLLocationCoordinate2D coordinate = placemark.location.coordinate;
                
                NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin={{我的位置}}&destination=latlng:%f,%f|name=目的地&mode=driving&coord_type=gcj02",coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            }
        }];
         */
        
    }else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]]){
        
        //  地图返编码
        CLGeocoder * geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:addressStr completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            for (CLPlacemark * placemark in placemarks) {
                // 坐标 (经纬度)
                CLLocationCoordinate2D coordinate = placemark.location.coordinate;
                
                NSString * appName = @"新家装通";
                NSString * urlScheme = @"iosamap";
                NSString *urlString = [[NSString stringWithFormat:@"iosamap://navi?sourceApplication=%@&backScheme=%@&lat=%f&lon=%f&dev=0&style=2",appName,urlScheme,coordinate.latitude, coordinate.longitude] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            }
        }];
    }else{
        resultStr = @"false";
    }
    
    CDVPluginResult * result = nil;
    
    if (command.arguments.count) {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultStr];
    }else{
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"地图导航出错"];
    }
    [self.commandDelegate sendPluginResult:result callbackId:callBackID];
}

@end
