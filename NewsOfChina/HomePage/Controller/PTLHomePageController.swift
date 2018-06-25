//
//  PTLHomePageController.swift
//  NewsOfChina
//
//  Created by soliloquy on 2018/6/23.
//  Copyright © 2018年 soliloquy. All rights reserved.
//

import UIKit
import YYModel
import MJRefresh


class PTLHomePageController: UIViewController {

    // 默认页码
    var pages: Int = 0
    // 每次请求个数
    let count: Int = 20
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataSource = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabView()
        addObservers()
    }
    
    
    deinit {
        removeObserver(self, forKeyPath: "dataSource")
    }
}

extension PTLHomePageController {
    func addObservers() {

        addObserver(self, forKeyPath: "dataSource", options: [.new], context: nil)
    }
    
    
    override func addObserver(_ observer: NSObject, forKeyPath keyPath: String, options: NSKeyValueObservingOptions = [], context: UnsafeMutableRawPointer?) {
        if !(keyPath == "dataSource") {
            return
        }
        
        if self.dataSource.count == 0 {
            // 显示展位图
            
            // 点击展位图刷新数据
            return
        }
        
        // 移除展位图
        
        
    }
}

// MARK: setupTabView
extension PTLHomePageController {
    func setupTabView() {
        tableView.register(UINib(nibName: "PTLHomePageCell", bundle: nil), forCellReuseIdentifier: "PTLHomePageCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(requstNewData))
        tableView.mj_header.beginRefreshing()
        
        let footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(requstMoreData))
        footer?.setTitle("--我是有底线的人--", for: MJRefreshState.noMoreData)
        tableView.mj_footer = footer
    }
}

// MARK: 加载数据
extension PTLHomePageController {
     func requstData(_ isLoadingNewData: Bool? = true) {
        

        if isLoadingNewData! {
            pages = 0
        }else {
            pages = pages + 1
        }

        let urlStr = "http://v5.chinapeace.gov.cn/app_if/getArticles?columnId=7&lastFileId=0&count=\(count)&rowNumber=\(pages*count)&version=0&adv=1"

        PTLNetworkTools.requestDate(urlStr, method: .get, parameters: nil, successCompletion: { (result) in
            
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            
            let arr: NSArray = NSArray.yy_modelArray(with: PTLHomePageModel.classForCoder(), json: result["list"] ?? [])! as NSArray
            if isLoadingNewData! {
                self.dataSource.removeAllObjects()
                self.dataSource = arr.mutableCopy() as! NSMutableArray
            }else {
                self.dataSource.addObjects(from: arr as! [Any])
            }

            if arr.count < self.count {
                self.tableView.mj_footer.endRefreshingWithNoMoreData()
            }
            
//
            self.tableView.reloadData()
            
            print("arr: \(self.dataSource)")
        }) { (error) in
            
        }
    }
    
    // MARK: 下拉
    @objc func requstNewData() {
        
        requstData(true)
    }
    
    // MARK: 上拉
    @objc func requstMoreData() {
        
        requstData(false)
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension PTLHomePageController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSource.count == 0 {
            tableView.mj_footer.isHidden = true
            tableView.mj_header.isHidden = true
        }else {
            tableView.mj_footer.isHidden = false
            tableView.mj_header.isHidden = false
        }
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"PTLHomePageCell", for: indexPath) as! PTLHomePageCell
        cell.model = dataSource[indexPath.row] as? PTLHomePageModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


