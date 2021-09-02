//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"

@interface ImageModel()
@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSDictionary* imageDict;
@end
@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imageDict = _imageDict;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSArray*) imageNames{
    if(!_imageNames)
        _imageNames = @[@"Bill",@"Eric",@"Jeff",@"cat",@"rainbow",@"sunset"];
    
    return _imageNames;
}

-(NSDictionary*) imageDict{
    if(!_imageDict){
        _imageDict = @{@"Bill":[UIImage imageNamed:@"Bill"],
                       @"Eric":[UIImage imageNamed:@"Eric"],
                       @"Jeff":[UIImage imageNamed:@"Jeff"],
                       @"cat":[UIImage imageNamed:@"cat"],
                       @"rainbow":[UIImage imageNamed:@"rainbow"],
                       @"sunset":[UIImage imageNamed:@"sunset"]
        };
    }
    return _imageDict;
}

-(UIImage*)getImageWithName:(NSString*)name{
    return self.imageDict[name];
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    NSString* imageName = self.imageNames[index];
    return self.imageDict[imageName];
}

-(NSInteger)numberOfImages{
    return [self.imageNames count];
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    return self.imageNames[index];
}

@end
