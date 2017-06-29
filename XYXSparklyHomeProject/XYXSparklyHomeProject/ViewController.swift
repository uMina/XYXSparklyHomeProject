//
//  ViewController.swift
//  XYXSparklyHomeProject
//
//  Created by Teresa on 2017/6/21.
//  Copyright © 2017年 Teresa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Const
    var naviBarHeight: CGFloat = 80.0
    var headerDefaultHeight:CGFloat = 230.0
    
    //UI Member
    let headerView = Bundle.main.loadNibNamed("XYXSearchHeaderView", owner: nil, options: nil)?.last as! XYXSearchHeaderView
    let naviBar = Bundle.main.loadNibNamed("XYXSearchNaviBar", owner: nil, options: nil)?.last as! XYXSearchNaviBar
    let tableView = UITableView()
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureTableView()
        configureNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Configure UI
    func configureNavBar(){
        naviBarHeight = naviBar.frame.height
        naviBar.isHidden = true
        view.addSubview(naviBar)
    }
    
    func configureTableView(){
        headerDefaultHeight = headerView.frame.height
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.frame = headerView.frame
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        var alphaScale: CGFloat = 0.0
        
        naviBar.isHidden = true
        if offsetY < 0 {
            alphaScale = 0.0
        }else if offsetY > (headerDefaultHeight - naviBarHeight){
            alphaScale = 0.0
            naviBar.isHidden = false
        }else{
            alphaScale = offsetY / (headerDefaultHeight - naviBarHeight)
        }
        self.headerView.alphaScale = alphaScale
        self.headerView.offsetY = offsetY;
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "test")
        cell.textLabel?.text = "第\(indexPath.row)个按钮"
        return cell
    }
    
    
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
