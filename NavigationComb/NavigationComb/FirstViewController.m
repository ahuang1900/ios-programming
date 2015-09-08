//
//  FirstViewController.m
//  NavigationComb
//
//  Created by 黄生辉 on 15/9/7.
//  Copyright (c) 2015年 yy Inc. All rights reserved.
//

#import "FirstViewController.h"
#import "DetailViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    UINavigationController *navc = (UINavigationController*)self.parentViewController;
    NSString *selectProvinces = navc.tabBarItem.title;
    
    NSLog(@"%@", selectProvinces);
    
    if ([selectProvinces isEqualToString:@"黑龙江"]) {
        self.listData = [self.dictData objectForKey:@"黑龙江省"];
        self.navigationItem.title = @"黑龙江省信息";
    } else if ([selectProvinces isEqualToString:@"吉林"]) {
        self.listData = [self.dictData objectForKey:@"吉林省"];
        self.navigationItem.title = @"吉林省信息";
    } else {
        self.listData = [self.dictData objectForKey:@"辽宁省"];
        self.navigationItem.title = @"辽宁省信息";
    }
}

#pragma mark - 实现表视图数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *FirstLevelCell = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstLevelCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier: FirstLevelCell];
    }
    
    NSInteger row = [indexPath row];
    NSDictionary *dict = [self.listData objectAtIndex:row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        DetailViewController *detvc = segue.destinationViewController;
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        NSDictionary *dict = [self.listData objectAtIndex:selectedIndex];
        detvc.url = [dict objectForKey:@"url"];
        detvc.title = [dict objectForKey:@"name"];
        
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
