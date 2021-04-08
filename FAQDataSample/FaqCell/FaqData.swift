//
//  FaqData.swift
//  MyPoin
//
//  Created by Rheza Pahlevi on 06/04/21.
//  Copyright © 2021 EDTS. All rights reserved.
//

import Foundation

class FaqData: NSObject {
    var bankName: String
    var bankLogo: String
    var bankTutorial = [String]()

    init(bankName: String, bankLogo: String, bankTutorial: [String]) {
        self.bankName = bankName
        self.bankLogo = bankLogo
        self.bankTutorial = bankTutorial
    }

}
