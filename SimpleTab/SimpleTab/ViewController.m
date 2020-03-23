//
//  ViewController.m
//  SimpleTab
//
//  Created by 方存 on 2020/3/23.
//  Copyright © 2020 JKB. All rights reserved.
//

#import "ViewController.h"
#import "FCTableViewCell.h"
#import "Masonry.h"
#import "FCModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createData];
    [self setupUI];
}

- (void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (void)createData {
    
    NSArray *textArr = @[
        @"我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内",
        @"UI哦豁六合八荒很牛逼的撒飞鸟的阿道夫安抚阿斯蒂芬安抚安抚爱斯达克你；了；狂欢节苷啊熬过来；安居房大发发发安居客；了康啊啊公司搞法合八荒很牛逼的撒飞鸟的阿道夫安抚阿斯蒂芬安抚安抚爱斯达克你；了；狂欢节苷啊熬过来；安居房大发发发安居客；了康啊啊公司搞法合八荒很牛逼的撒飞鸟的阿道夫安抚阿斯蒂芬安抚安抚爱斯达克你；了；狂欢节苷啊熬过来；了康啊啊公司搞法",
    @"wereqwrfdsfsadfsa放大沙发撒旦法撒发送大法师法撒旦法师法师发打分阿萨德大师傅爱读书发发打算发送到发送到阿萨德爱上爱上撒",
    @"aaaaaaaaaaaa啊啊啊啊啊啊啊",
    @"",
    @"喷发胶垦利街道福利卡大师傅怒剑狂花金刚萨埵交罚款接口了就"];
    
    NSArray *arr1 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652378&di=464974169590d9ed26dabf1a27d68e80&imgtype=0&src=http%3A%2F%2Fblog.cocoachina.com%2Fuploads%2Fattachments%2F499434%2F20170817%2Fb9361e9675581aa885f28a7e4dab62f4.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=f67a70beb35368d0089826888f4ef652&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_baa89cd00dc368f.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=c2805d5dc669ec1df74391b0fc9b6b09&imgtype=0&src=http%3A%2F%2Fcc.cocimg.com%2Fapi%2Fuploads%2F20160714%2F1468463426558432.png"];
    
    NSArray *arr2 = @[
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=f67a70beb35368d0089826888f4ef652&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_baa89cd00dc368f.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=c2805d5dc669ec1df74391b0fc9b6b09&imgtype=0&src=http%3A%2F%2Fcc.cocimg.com%2Fapi%2Fuploads%2F20160714%2F1468463426558432.png"];
    
    NSArray *arr3 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652378&di=464974169590d9ed26dabf1a27d68e80&imgtype=0&src=http%3A%2F%2Fblog.cocoachina.com%2Fuploads%2Fattachments%2F499434%2F20170817%2Fb9361e9675581aa885f28a7e4dab62f4.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=f67a70beb35368d0089826888f4ef652&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_baa89cd00dc368f.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=c2805d5dc669ec1df74391b0fc9b6b09&imgtype=0&src=http%3A%2F%2Fcc.cocimg.com%2Fapi%2Fuploads%2F20160714%2F1468463426558432.png",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652375&di=8010cb0e28449e98fbc5d0366b7efec1&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_0bc7cc4ecfa90b6.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939987558&di=95ca970fdff2455c370810b6be36a752&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F8aa70093b8577bda065f01579d6b35db4a2f1482229c2-XVMLf7_fw658"];
    
    NSArray *arr4 = @[
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=c2805d5dc669ec1df74391b0fc9b6b09&imgtype=0&src=http%3A%2F%2Fcc.cocimg.com%2Fapi%2Fuploads%2F20160714%2F1468463426558432.png"];
    
    NSArray *arr5 = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652378&di=464974169590d9ed26dabf1a27d68e80&imgtype=0&src=http%3A%2F%2Fblog.cocoachina.com%2Fuploads%2Fattachments%2F499434%2F20170817%2Fb9361e9675581aa885f28a7e4dab62f4.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=f67a70beb35368d0089826888f4ef652&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_baa89cd00dc368f.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=c2805d5dc669ec1df74391b0fc9b6b09&imgtype=0&src=http%3A%2F%2Fcc.cocimg.com%2Fapi%2Fuploads%2F20160714%2F1468463426558432.png",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652375&di=8010cb0e28449e98fbc5d0366b7efec1&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_0bc7cc4ecfa90b6.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584955296920&di=fa4c78a7fb57645dc69b2f8c367657e2&imgtype=0&src=http%3A%2F%2Fac-r.static.booking.cn%2Fimages%2Fhotel%2Fmax1024x768%2F175%2F17552265.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652378&di=464974169590d9ed26dabf1a27d68e80&imgtype=0&src=http%3A%2F%2Fblog.cocoachina.com%2Fuploads%2Fattachments%2F499434%2F20170817%2Fb9361e9675581aa885f28a7e4dab62f4.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=f67a70beb35368d0089826888f4ef652&imgtype=0&src=http%3A%2F%2Fcdn.cocimg.com%2Fbbs%2Fattachment%2FFid_23%2F23_18346_baa89cd00dc368f.jpg",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584939652376&di=c2805d5dc669ec1df74391b0fc9b6b09&imgtype=0&src=http%3A%2F%2Fcc.cocimg.com%2Fapi%2Fuploads%2F20160714%2F1468463426558432.png",
    @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584955296920&di=33b4737867dd0f4e37d5e67669ff3591&imgtype=0&src=http%3A%2F%2Fac-q.static.booking.cn%2Fimages%2Fhotel%2Fmax1024x768%2F111%2F111145520.jpg"];
    
    for (int i = 0; i < 6; i ++) {
        FCModel *model = [[FCModel alloc] init];
        model.idStr = [NSString stringWithFormat:@"%d",i];
        model.date = [NSString stringWithFormat:@"12:2%d",i];
        model.textContent = textArr[i];
        model.type = @"个人检测";
        if (i == 0) {
            model.imageArr = arr1;
        }else if (i == 2) {
            model.imageArr = arr3;
        }else if (i == 1) {
            model.imageArr = arr2;
        }else if (i == 4) {
            model.imageArr = arr4;
        }else if (i == 5) {
            model.imageArr = @[];
        }else{
            model.imageArr = arr5;
        }
        [self.dataArr addObject:model];
    }
}

#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.dataArr.count;
    }else{
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 45)];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 45)];
    label.text = [NSString stringWithFormat:@"2020-03-2%ld", (long)section];
    label.font = [UIFont systemFontOfSize:16];
    [view addSubview:label];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    FCTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[FCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.dataArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [FCTableViewCell returnCellH:self.dataArr[indexPath.row]];
}

#pragma mark - lazy
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
