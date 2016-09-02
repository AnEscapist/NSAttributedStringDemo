//
//  ViewController.m
//  NSAttributedStringDemo
//
//  Created by Caixia Sun on 16/9/1.
//  Copyright © 2016年 CaixiaSun. All rights reserved.
//

#import "ViewController.h"
#import "MyTools.h"
#import "TextCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

static NSString *cellIdentifier = @"TextCell";

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.dataSource = [NSMutableArray new];
    [self.dataSource addObjectsFromArray:@[kString1,kString2,kString3,kString4]];
    
    [self.tableView registerNib:[UINib nibWithNibName:cellIdentifier bundle:nil] forCellReuseIdentifier:cellIdentifier];

}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSMutableAttributedString *attributedString;
    switch (indexPath.row) {
        case 0:
        {
            NSString *string = [self.dataSource objectAtIndex:0];
            NSString *subStr1 = [string substringToIndex:2];
            NSString *subStr2 = [string substringFromIndex:string.length-3];
            attributedString = [MyTools changeColorWithColor:[UIColor purpleColor] OriginString:[self.dataSource objectAtIndex:0] ChangeStringArray:@[subStr1,subStr2]];
            break;
        }
        case 1:
        {
            NSString *string = [self.dataSource objectAtIndex:1];
            NSString *subStr1 = [string substringToIndex:2];
            NSString *subStr2 = [string substringFromIndex:string.length-6];
            attributedString = [MyTools changeFontAndColorWithFont:[UIFont boldSystemFontOfSize:17] Color:[UIColor redColor] OriginString:string ChangeStringArray:@[subStr2,subStr1]];
            break;
        }
        case 2:
        {
            NSString *string = [self.dataSource objectAtIndex:2];
            attributedString = [MyTools changeLineSpaceWithSpace:10 OriginString:string];
            break;
        }
        default:
        {
            NSString *string = [self.dataSource objectAtIndex:3];
            attributedString = [MyTools changeFontSpaceWithSpace:10 OriginString:string];
            break;
        }
    }
    cell.titleLab.attributedText = attributedString;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= 1) {
        return [MyTools calculateHeightWithContent:[self.dataSource objectAtIndex:indexPath.row]]+50;
    }
    return [MyTools calculateHeightWithContent:[self.dataSource objectAtIndex:indexPath.row]];
}




@end
