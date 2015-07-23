//
//  ViewController.m
//  SelectPhoto
//
//  Created by wangtian on 15/7/23.
//  Copyright (c) 2015年 wangtian. All rights reserved.
//

#import "ViewController.h"
#import "SelectPhotoViewController.h"
@interface ViewController ()

@property (nonatomic, strong) SelectPhotoViewController *selectPhoto;

@end

@implementation ViewController

- (SelectPhotoViewController *)selectPhoto
{
    if (_selectPhoto == nil)
    {
        _selectPhoto = [[SelectPhotoViewController alloc] init];
    }
    return _selectPhoto;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configueSelectPhotoVC];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 配置选择图片弹窗vc
- (void)configueSelectPhotoVC
{
    self.selectPhoto.selectPhotoBlock = ^(NSMutableArray *photoArray){
    
        NSLog(@"%@",photoArray);
    };
    
    self.selectPhoto.setClickBtnBlock = ^(NSInteger clickIndex){
    
        if (clickIndex == 1)
        {
            NSLog(@"拍摄");
        }
        else if (clickIndex == 2)
        {
            NSLog(@"从相册选择");
        }
    };
}

- (IBAction)show:(UIButton *)sender
{
    [self.selectPhoto showOrHiddenSelectPhotoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
