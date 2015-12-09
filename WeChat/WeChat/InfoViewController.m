//
//  InfoViewController.m
//  WeChat
//
//  Created by Sure on 15-8-28.
//  Copyright (c) 2015年 Sure. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"个人信息";
    
    //更改返回键颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self createTableView];
    
    // Do any additional setup after loading the view.
}
- (void)createTableView{
    //关闭自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}
//设置TableView中段Section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;// 0 1 2 3
}
//设置具体某一段有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else if (section == 1){
        return 3;
    }else{
        return 1;
    }
}
//显示具体内容
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ID"];
    //设置具体每段每行的内容
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
        cell.textLabel.text = @"头像";
            UIImageView * headImage = [[UIImageView alloc]initWithFrame:CGRectMake(260, 15, 70, 70)];
            headImage.image = [UIImage imageNamed:@"1"];
            headImage.layer.cornerRadius = 5;
            headImage.clipsToBounds = YES;
            [cell.contentView addSubview:headImage];
        }else if (indexPath.row == 1){
        cell.textLabel.text = @"名字";
            cell.detailTextLabel.text = @"卖报的小画家";
        }else if (indexPath.row == 2){
        cell.textLabel.text = @"微信号";
            cell.detailTextLabel.text = @"maibao781085";
        }else if (indexPath.row == 3){
        cell.textLabel.text = @"我的二维码";
        }else{
        cell.textLabel.text = @"我的地址";
        }
        
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"性别";
           cell.detailTextLabel.text = @"男";
        }else if(indexPath.row == 1){
            cell.textLabel.text = @"地区";
            cell.detailTextLabel.text = @"中国";
        }else{
        cell.textLabel.text = @"个性签名";
            cell.detailTextLabel.text = @"你非我良人 怎知我情深";
        }
    }else if (indexPath.section == 2){
        
            cell.textLabel.text = @"LinkedIn账号";
        cell.detailTextLabel.text = @"未设置";
    }
    //设置右侧按钮的样式
    /*
     UITableViewCellAccessoryDisclosureIndicator
     UITableViewCellAccessoryDetailDisclosureButton
     UITableViewCellAccessoryDetailButton
     UITableViewCellAccessoryCheckmark
     */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //去除系统默认的点击效果 添加点击动画
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 100;
        }else{
            return 44;
        }
    }else{
        return 44;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
