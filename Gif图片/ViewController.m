//
//  ViewController.m
//  Gif图片
//
//  Created by huangwei on 2019/11/8.
//  Copyright © 2019年 huangwei. All rights reserved.
//

#import "ViewController.h"
#import "IKAnimatedImageView.h"
//Gif解码器
#import "IKGifImageDecoder.h"

@interface ViewController (){
    IKAnimatedImageView *gifImageView;
    
    BOOL bUseCAKeyFrameAnimation;
    NSInteger pictureIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bUseCAKeyFrameAnimation = NO;
    pictureIndex = 1;
    [self reloadImage];
}
-(void)reloadImage
{
    if (gifImageView){
        [gifImageView removeFromSuperview];
        gifImageView = nil;
    }
    gifImageView = [[IKAnimatedImageView alloc] initWithFrame: CGRectMake(20, 100, 320, 240)];
    [self.view addSubview: gifImageView];
    
    NSString *pictureName = [NSString stringWithFormat: @"%ld", pictureIndex];
    NSString *filePath = [[NSBundle mainBundle] pathForResource: pictureName ofType: @"gif"];
    
    IKAnimatedImage *tmpImage = [IKAnimatedImage animatedImageWithImagePath: filePath Decoder: [IKGifImageDecoder decoder]];
    if (bUseCAKeyFrameAnimation)
        gifImageView.keyframeAnimation = [tmpImage convertToKeyFrameAnimation];
    else
        gifImageView.image = tmpImage;
    [gifImageView startAnimation];
    
}

@end
