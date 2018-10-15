//  ButtonBarExampleViewController.swift
//  XLPagerTabStrip ( https://github.com/xmartlabs/XLPagerTabStrip )
//
//  Copyright (c) 2017 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import XLPagerTabStrip

class ButtonBarExampleViewController: ButtonBarPagerTabStripViewController {

    var isReload = false

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonBarView.selectedBar.backgroundColor = .orange
        buttonBarView.backgroundColor = UIColor(red: 7/255, green: 185/255, blue: 155/255, alpha: 1)
    }

    // MARK: - PagerTabStripDataSource

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        let child_1_item = IndicatorInfo(title: "Table View", counter: 1)
        let child_1 = TableChildExampleViewController(style: .plain, itemInfo: child_1_item)
        
        let child_2_item = IndicatorInfo(title: "View", counter: 2)
        let child_2 = ChildExampleViewController(itemInfo: child_2_item)
        
        let child_3_item = IndicatorInfo(title: "Table View 2", counter: 3)
        let child_3 = TableChildExampleViewController(style: .grouped, itemInfo: child_3_item)
        
        let child_4_item = IndicatorInfo(title: "View 2", counter: 4)
        let child_4 = ChildExampleViewController(itemInfo: child_4_item)
        
        let child_5_item = IndicatorInfo(title: "Table View 3", counter: 5)
        let child_5 = TableChildExampleViewController(style: .plain, itemInfo: child_5_item)
        
        let child_6_item = IndicatorInfo(title: "View 3", counter: 6)
        let child_6 = ChildExampleViewController(itemInfo: child_6_item)
        
        let child_7_item = IndicatorInfo(title: "Table View 4", counter: 7)
        let child_7 = TableChildExampleViewController(style: .grouped, itemInfo: child_7_item)
        
        let child_8_item = IndicatorInfo(title: "View 4", counter: 8)
        let child_8 = ChildExampleViewController(itemInfo: child_8_item)

        guard isReload else {
            return [child_1, child_2, child_3, child_4, child_5, child_6, child_7, child_8]
        }

        var childViewControllers = [child_1, child_2, child_3, child_4, child_5, child_6, child_7, child_8]

        for index in childViewControllers.indices {
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index {
                childViewControllers.swapAt(index, n)
            }
        }
        let nItems = 1 + (arc4random() % 8)
        return Array(childViewControllers.prefix(Int(nItems)))
    }

    override func reloadPagerTabStripView() {
        isReload = true
        if arc4random() % 2 == 0 {
            pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0, elasticIndicatorLimit: arc4random() % 2 == 0 )
        } else {
            pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
        }
        super.reloadPagerTabStripView()
    }
}
