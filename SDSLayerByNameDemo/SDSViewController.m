//
//  SDSViewController.m
//  SDSLayerByNameDemo
//
//  Created by sergio on 9/11/13.
//  Copyright (c) 2013 Sergio De Simone, Freescapes Labs. All rights reserved.
//

#import "SDSViewController.h"
#import "CALayer+SDSLayerByName.h"

@interface SDSViewController () 

@end

@implementation SDSViewController

/////////////////////////////////////////////////////////////////////////////////////////
- (void)addImageNamed:(NSString*)imgName {
    
    UIImage* img = [UIImage imageNamed:imgName];
    CALayer* imgLayer = [CALayer layer];
    imgLayer.bounds = (CGRect){CGPointZero, img.size};
    
    imgLayer.contents = (id)img.CGImage;
    imgLayer.position = self.view.center;
    imgLayer.name = imgName;
    
    [self.view.layer addSublayer:imgLayer];
}

/////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addImageNamed:@"img1.jpg"];
    [self addImageNamed:@"img2.jpg"];
    [self addImageNamed:@"img3.jpg"];
    [self hideLayers];
}

/////////////////////////////////////////////////////////////////////////////////////////
- (void)hideLayers {

    [self.view.layer layerByName:@"img1.jpg"].opacity = 0.0;
    [self.view.layer layerByName:@"img2.jpg"].opacity = 0.0;
    [self.view.layer layerByName:@"img3.jpg"].opacity = 0.0;
}

/////////////////////////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////////////////////////////////////////////////////////////////////////////////////////
- (void)textFieldDidEndEditing:(UITextField*)textField {
    
    NSString* name = textField.text;
    
    [self hideLayers];
    
    if ([self.view.layer layerByName:name])
        [self.view.layer layerByName:name].opacity = 1.0;
}

/////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  
    [textField resignFirstResponder];
//    [self textFieldDidEndEditing:textField];
    return YES;
}


@end
