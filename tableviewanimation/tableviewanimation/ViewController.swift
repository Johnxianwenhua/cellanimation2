//
//  ViewController.swift
//  tableviewanimation
//
//  Created by holdtime on 2018/1/18.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

import UIKit

let kUITableviewCell = "uitableviewcell"
let kViewTag = 100
let kImageViewTag = 101

class ViewController: UIViewController {

    @IBOutlet weak var tTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutCell(){
        for cell in tTableview.visibleCells{
            let view = cell.contentView.viewWithTag(kViewTag)
            let imageview = view?.viewWithTag(kImageViewTag)
            let rect = view?.convert((view?.bounds)!, to: nil)
            var Y = UIScreen.main.bounds.size.height - (rect?.origin.y)! - 600
            Y*=0.2
            if Y > 0 {
                Y = 0
            }
            if Y < -100 {
                Y = -100
            }
            imageview?.frame.origin.y = Y
            
        }
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kUITableviewCell, for: indexPath)
        layoutCell()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        layoutCell()
    }
}

