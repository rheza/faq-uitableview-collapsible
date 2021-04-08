//
//  ViewController.swift
//  FAQDataSample
//
//  Created by Rheza Pahlevi on 08/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource   {

    @IBOutlet weak var tableView: UITableView!
    
    var faqData = [FaqData]()
    
    var tappedIndexPath: IndexPath?
    var indexPathSection = [IndexPath]()
    var heightAtIndexPath = [IndexPath: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "FaqHeaderCell", bundle: nil), forCellReuseIdentifier: "FaqHeaderCell")
        
        tableView.register(UINib.init(nibName: "FaqStepCell", bundle: nil), forCellReuseIdentifier: "FaqStepCell")
        
        tableView.register(UINib.init(nibName: "FaqFirstCell", bundle: nil), forCellReuseIdentifier: "FaqFirstCell")
        
        // Do any additional setup after loading the view.
        
        for index in 1...5 {
 
            var tutorial = [String]()
            tutorial.append("Step 1")
            tutorial.append("Step 2")
            tutorial.append("Step 3")
            tutorial.append("Step 4")
            
            let tutorialData = FaqData(bankName: "List \(index)", bankLogo: "imageUrl", bankTutorial: tutorial)
            
            faqData.append(tutorialData)
            
            
        }
        
        for i in 0...faqData.count {
            
            let indexPath = IndexPath(row: 0, section: i)
            indexPathSection.append(indexPath)
            
        }
    }

    
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqData[section].bankTutorial.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.tappedIndexPath = indexPath
            
            if indexPathSection.contains(self.tappedIndexPath ?? IndexPath(row: 0, section: 0)) {
                if let index = indexPathSection.firstIndex(where: {$0 == self.tappedIndexPath}){
                    indexPathSection.remove(at: index)
                }
            } else {
                indexPathSection.append(indexPath)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.tableView.reloadData()
                self.tableView.layoutIfNeeded()
                self.tableView.setContentOffset(CGPoint.zero, animated: false)
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: indexPath.section), at: .top, animated: false)
            }
            
            
        }
        
       
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        for index in indexPathSection {
            
            if index.section == indexPath.section {
                if indexPath.row != 0 {
                    return 0
                } else {
                    return tableView.estimatedRowHeight
                }
            }
            
        }
        
        return tableView.rowHeight
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return faqData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if faqData.count != 0 {
            
            let lastIndex = faqData[indexPath.section].bankTutorial.count
            
            if indexPath.row == 0 {
                
                if !indexPathSection.contains(indexPath) {
                     let headerCell = tableView.dequeueReusableCell(withIdentifier: "FaqHeaderCell", for: indexPath) as! FaqHeaderCell
                    
                   // headerCell.bankLogo.sd_setImage(with: URL(string: faqData[indexPath.section].bankLogo))
                    
                    headerCell.bankName.text =
                        faqData[indexPath.section].bankName
                    
                    headerCell.selectionStyle = .none
                    
                    headerCell.bottomConstraint.constant = -8
                    
                    headerCell.arrowLogo.image = UIImage(named: "arrow_up")
                    
                    return headerCell
                }
                
                let headerCell = tableView.dequeueReusableCell(withIdentifier: "FaqHeaderCell", for: indexPath) as! FaqHeaderCell
                
               // headerCell.bankLogo.sd_setImage(with: URL(string: faqData[indexPath.section].bankLogo))
                
                headerCell.bankName.text =
                    faqData[indexPath.section].bankName
                
                headerCell.selectionStyle = .none
                headerCell.topConstraint.constant = 10
                headerCell.bottomConstraint.constant = 6
                headerCell.arrowLogo.image = UIImage(named: "arrow_down")
                
                return headerCell
                
                
            } else if indexPath.row == lastIndex {
                let stepCell = tableView.dequeueReusableCell(withIdentifier: "FaqStepCell", for: indexPath) as! FaqStepCell
                
                
                stepCell.stepNo.text = String(indexPath.row) + "."
                stepCell.step.text = faqData[indexPath.section].bankTutorial[indexPath.row-1]
                
                stepCell.selectionStyle = .none
                stepCell.clipsToBounds = true
                
                return stepCell
            }else {
                let firstCell = tableView.dequeueReusableCell(withIdentifier: "FaqFirstCell", for: indexPath) as! FaqFirstCell
                
                
                firstCell.stepNo.text = String(indexPath.row) + "."
                firstCell.step.text = faqData[indexPath.section].bankTutorial[indexPath.row-1]
                firstCell.selectionStyle = .none
                
                return firstCell
            }
        }
        else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightAtIndexPath[indexPath] ?? UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.heightAtIndexPath[indexPath] = cell.frame.size.height
    }
}

