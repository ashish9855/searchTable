//
//  iGetData.m
//  searchTable
//
//  Created by ADMIN on 12/3/13.
//  Copyright (c) 2013 Individual. All rights reserved.
//

#import "iGetData.h"

@implementation iGetData

@synthesize setTableData;

-(id)init{
    
    if(self=[super init]){
        
        //    array which contains data to be shown on table view
        //                              &&
        //               Change it according to your need
        
        self.setTableData=[NSArray arrayWithObjects:@"abc",@"cfg",@"def",@"rty",@"qwer",@"der",@"rtyu",@"rtyui",@"objk",@"egh",@"ihjk",@"lmkj",@"min",@"nugug",@"sad",@"tyee",@"sdtg",nil];
    }
    return self;
}

@end
